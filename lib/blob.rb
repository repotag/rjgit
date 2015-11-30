module RJGit
  
  import 'org.eclipse.jgit.revwalk.RevBlob'
  import 'org.eclipse.jgit.diff.RawText'
  
  class Blob 
    
    attr_reader :id, :mode, :name, :path, :jblob
    alias_method :get_name, :id
    
    RJGit.delegate_to(RevBlob, :@jblob)

    def initialize(repository, mode, path, jblob)
      @jrepo = RJGit.repository_type(repository)
      @jblob = jblob
      @path = path
      @name = @path ? File.basename(@path) : nil
      @mode = mode
      @id = ObjectId.toString(jblob.get_id)
    end
    
    # The size of this blob in bytes
    #
    # Returns Integer
    def bytesize
      @bytesize ||= @jrepo.open(@jblob).get_size 
    end

    def size
      @size ||= bytesize
    end
    
    def blame(options={})
      @blame ||= RJGit::Porcelain.blame(@jrepo, @path, options)
    end

    # The binary contents of this blob.
    # Returns String
    def data
      @data ||= RJGit::Porcelain.cat_file(@jrepo, @jblob) 
    end
    
    def is_symlink?
      @mode == SYMLINK_TYPE
    end
    
    def binary?
      RawText.is_binary(self.data.to_java_bytes)
    end
    
    def line_count
      self.binary? ? 0 : self.data.split("\n").size
    end
    
    # The mime type of this file (based on the filename)
    # Returns String
    def mime_type
      Blob.mime_type(self.name)
    end

    def self.mime_type(filename)
      guesses = MIME::Types.type_for(filename) rescue []
      guesses.first ? guesses.first.simplified : DEFAULT_MIME_TYPE
    end
    
    def self.new_from_string(repository, contents)
      repository = RJGit.repository_type(repository)
      blob_id = RJGit::Plumbing::TreeBuilder.new(repository).write_blob(contents, true)
      walk = RevWalk.new(repository)
      Blob.new(repository, REG_FILE_TYPE, nil, walk.lookup_blob(blob_id))
    end
    
    # Finds a particular Blob in repository matching file_path
    def self.find_blob(repository, file_path, revstring=Constants::HEAD)
      jrepo = RJGit.repository_type(repository)
      last_commit_hash = jrepo.resolve(revstring)
      return nil if last_commit_hash.nil?

      walk = RevWalk.new(jrepo)
      jcommit = walk.parse_commit(last_commit_hash)
      treewalk = TreeWalk.new(jrepo)
      jtree = jcommit.get_tree
      treewalk.add_tree(jtree)
      treewalk.set_recursive(true)
      treewalk.set_filter(PathFilter.create(file_path))
      if treewalk.next
        jblob = walk.lookup_blob(treewalk.objectId(0))
        if jblob
          mode = RJGit.get_file_mode_with_path(jrepo, file_path, jtree) 
          Blob.new(jrepo, mode, file_path, jblob)
        end
      else
        nil
      end
    end

  end
end
