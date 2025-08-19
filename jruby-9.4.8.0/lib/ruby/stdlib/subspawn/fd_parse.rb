require_relative './fd_types'
require_relative './graph_helper'
require_relative './pipes'

module SubSpawn::Internal
	# argument value to int (or :tty)
	def self.parse_fd(fd, allow_pty=false)
		# fd = if fd.respond_to? :to_path
		# fd = if fd.respond_to? :to_file
		# fd = if fd.respond_to? :to_file
		case fd
		when Integer then fd
		when IO then fd.fileno
		when :in, :input, :stdin then 0
		when :out, :output, :stdout then 1
		when :err, :error, :stderr then 2
		else
			if allow_pty and %i{pty tty}.include? fd
				:tty
			else
				raise ArgumentError, "Unknown FD type: #{fd.inspect}"
			end
		end
	end

	# mode conversion
	def self.guess_mode(d)
		read = d.include? 0 # stdin
		write = (d.include? 1 or d.include? 2) # stdout
		if read && write
			raise ArgumentError, "Invalid FD source specification: ambiguious mode (r & w)"
		elsif read
			:read
		elsif write
			:write
		else
			raise ArgumentError, "Invalid FD source specification: ambiguious mode (stdio missing)"
		end
	end

	# make FdSource objects of each redirection
	def self.parse_fd_opts(fds, &settty)
		child_lookup = {}
		fds.map do |dests, src|
			d = dests.map{|x| parse_fd(x, true)} # TODO: configurable
			src = case src
			when Array
				case src.first
				when String # file
					#raise ArgumentError, "Invalid :child FD source specification" unless src.length == 2
					# TODO: validate
					FdSource::File.new(d, *src)
				when :child
					raise ArgumentError, "Invalid :child FD source specification" unless src.length == 2
					# {a => c, b => [child, a]} is the same as {[a, b] => c}
					# so we can transform the former into the latter
					newfd = parse_fd(src.last)
					# TODO: this isn't an error, create a new one
					raise ArgumentError, "Invalid :child FD source specification" unless child_lookup[newfd]
					child_lookup[newfd].tap{|child|
						# add our destinations to the source's redirection
						d.each { |di| child.dests << di }
					}
				else
					raise ArgumentError, "Invalid FD source specification"
				end
			when String
				FdSource::File.new d, src, ({read: IO::RDONLY, write: IO::WRONLY | IO::CREAT | IO::TRUNC}[guess_mode(d)])
			when :close
				FdSource::Close.new d
			when :pty, :tty
				FdSource::PTY.new d
			when :pipe
				FdSource::Pipe.new d, guess_mode(d)
			when :pipe_r
				FdSource::Pipe.new d, :read # TODO: ensure pipe direction is sensical
			when :pipe_w
				FdSource::Pipe.new d, :read
			else
				if d.include? :tty and src.is_a? File # TODO: is this redundant?
					settty.call(src.path)
					d.delete(:tty)
				end
				FdSource::Basic.new d, parse_fd(src)
			end
			# save redirected fds so we can sneak a child reference in
			src.tap{|x| d.each{|c|
				raise ArgumentError, "Invalid FD source specification: duplicate FDs" if child_lookup[c]
				child_lookup[c] = x
				} }
		end.reject(&:nil?)
	end

	# convert an unordered list of FdSource's into an ordered list with appropriate
	# temporaries for a correct swap
	def self.graph_order(fds)
		# Note that we keep all dests together. It may be smarter to break dests apart to avoid 
		# temporaries, but that is left as an excercise to the reader
		next_temp = [fds.map(&:max).max || 2, 2].max + 1
		graph = Bigraph.new
		# build graphs
		fds.each do |fd|
			from = fd.heads || [Object.new]
			to = fd.tails || [Object.new]
			from.zip(to) do |h, t|
				graph.insert(h, t, fd)
			end
		end
		#puts graph.to_dot
		# find and break cycles
		while point = graph.find_cycle
			# we probably could find the least-cost fd, but this will do for now
			items = graph.delete_outgoing(point)
			#p items
			temp = FdSource::Temp.new([next_temp], point.to_i)
			close = FdSource::Close.new([next_temp])
			items = [temp, *items.map{|x|x.temp_source(next_temp)}, close]
			#p items
			# reinsert
			items.each do |fd|
				from = fd.heads || [Object.new]
				to = fd.tails || [Object.new]
				from.zip(to) do |h, t|
					graph.insert(h, t, fd)
				end
			end
			#puts graph.to_dot
		end
		#puts "removed all cycles, hopeuflly"
		elts = graph.ordered_kahn.reverse # execute in the opposite order of dependencies
		#puts graph.to_dot
		elts
	end

	# I'd love to use this method, but it doesn't accept env
	# def self.which_jruby(cmd)
	# 	require 'jruby'
	# 	org.jruby.util.ShellLauncher.findPathExecutable(JRuby.runtime, cmd)&.absolute_path
	# end

	def self.which(cmd, env)
		return nil if cmd.nil? or cmd.to_str == ""
		SubSpawn::Platform. 
			expand_which(cmd, env).
			lazy.
			find {|x|!File.directory? x and File.executable? x}
	end
end
