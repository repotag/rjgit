module RJGit
  
  import 'org.eclipse.jgit.revwalk' 
  import 'org.eclipse.jgit.revwalk.RevTree'
  
  class Tree 

    attr_reader :contents, :id, :mode, :name, :repo, :path, :jtree
    alias_method :get_name, :id
    RJGit.delegate_to(RevTree, :@jtree)
    include Enumerable
    
    def initialize(repository, mode, path, jtree)
      @jrepo = RJGit.repository_type(repository)
      @mode = mode
      @path = path
      @name = @path ? File.basename(path) : nil
      @jtree = jtree
      @id = ObjectId.to_string(jtree.get_id)
    end
    
    def data
      return @contents if @contents
      strio = StringIO.new
      RJGit::Porcelain.ls_tree(@jrepo, @path, Constants::HEAD, options={:print => true, :io => strio})
      @contents = strio.string
    end

    def count
      contents_array.size
    end
          
    def recursive_contents_array(limit = nil)
      if @recursive_contents.nil? || @recursive_contents[:limit] != limit
        @recursive_contents = {}
        @recursive_contents[:objects] = jtree_entries({recursive: true, limit: limit})
        @recursive_contents[:limit] = limit
      end
      @recursive_contents[:objects]
    end
    
    def recursive_count(limit = nil)
      recursive_contents_array(limit).size
    end

    def find_blob(&block)
      return nil unless block_given?
      find(:Blob) {|tree_entry| yield tree_entry }
    end

    def find_tree(&block)
      return nil unless block_given?
      find(:Tree) {|tree_entry| yield tree_entry }
    end

    def find(type = nil, &block)
      return nil unless block_given?
      treewalk = init_walk
      while treewalk.next
        entry = tree_entry(treewalk)
        next if type && type != entry[:type]
        return wrap_tree_or_blob(entry[:type], entry[:mode], entry[:path], entry[:id]) if yield entry
      end
    end
    
    def each(&block)
      block_given? ? contents_array.each(&block) : contents_array.to_enum
    end
    
    def blobs
      @content_blobs ||= contents_array.select {|x| x.is_a?(Blob)}
    end
    
    def trees
      @content_trees ||= contents_array.select {|x| x.is_a?(Tree)}
    end
    
    def /(file)
      if file =~ /^\/+$/
        self
      else
        treewalk = TreeWalk.forPath(@jrepo, file, @jtree)
        if treewalk
          mode = treewalk.get_file_mode(0)
          wrap_tree_or_blob(obj_type(mode), mode.get_bits, treewalk.get_path_string, treewalk.get_object_id(0))
        else
          nil
        end
      end
    end
    
    def self.new_from_hashmap(repository, hashmap, base_tree = nil)
      jrepo = RJGit.repository_type(repository)
      tree_builder = Plumbing::TreeBuilder.new(jrepo)
      base_tree = RJGit.tree_type(base_tree)
      new_tree = tree_builder.build_tree(base_tree, hashmap, true)
      walk = RevWalk.new(jrepo)
      new_tree = walk.lookup_tree(new_tree)
      Tree.new(jrepo, TREE_TYPE, nil, new_tree)
    end
    
    def self.find_tree(repository, file_path, revstring=Constants::HEAD)
      jrepo = RJGit.repository_type(repository)
      return nil if jrepo.nil?
      last_commit = jrepo.resolve(revstring)
      return nil if last_commit.nil?

      walk = RevWalk.new(jrepo)
      commit = walk.parse_commit(last_commit)
      treewalk = TreeWalk.new(jrepo)
      jtree = commit.get_tree
      treewalk.add_tree(jtree)
      treewalk.set_filter(PathFilter.create(file_path))
      if treewalk.next
        jsubtree = walk.lookup_tree(treewalk.get_object_id(0))
        if jsubtree
          mode = RJGit.get_file_mode_with_path(jrepo, file_path, jtree) 
          Tree.new(jrepo, mode, file_path, jsubtree)
        end
      else
        nil
      end
    end

    private

    def contents_array
      @contents_ary ||= jtree_entries
    end

    def init_walk(recurse=false)
      treewalk = TreeWalk.new(@jrepo)
      treewalk.add_tree(@jtree)
      treewalk.set_recursive(true) if recurse
      treewalk
    end

    def tree_entry(treewalk)
      mode = treewalk.get_file_mode(0)
      {
        type: obj_type(mode),
        mode: mode.get_bits,
        name: treewalk.get_path_string,
        id: treewalk.get_object_id(0)
      }
    end

    def jtree_entries(options = {})
      treewalk = init_walk(options[:recursive])
      entries = []
      while treewalk.next
        mode = treewalk.get_file_mode(0)
        type = obj_type(mode)

        entries << wrap_tree_or_blob(type, mode.get_bits, treewalk.get_path_string, treewalk.get_object_id(0))

        break if options[:limit] && entries.size >= options[:limit].to_i
      end
      entries
    end

    def wrap_tree_or_blob(type, mode, path, id)
      walk = RevWalk.new(@jrepo)
      RJGit.const_get(type).new(@jrepo, mode, path, walk.parse_any(id)) 
    end

    def obj_type(mode)
      mode.get_object_type == Constants::OBJ_BLOB ? :Blob : :Tree
    end
    
  end
  
end
