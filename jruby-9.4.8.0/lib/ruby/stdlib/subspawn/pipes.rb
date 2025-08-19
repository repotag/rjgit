
class SubSpawn::IoHolder
	def initialize(map)
		@map = map
	end

	def [](key)
		tmp = get(key)
		tmp = tmp.to_io if tmp.respond_to? :to_io
		tmp
	end
	def get(key)
		@map[SubSpawn::Internal.parse_fd(key, true)]
	end
	def composite? key
		self.get(key).is_a? Composite
	end
	def empty?
		@map.values.reject(&:nil?).empty?
	end

	class Composite
	end

	class Pipe < Composite
		def initialize(parent, child)
			@parent, @child = parent, child
		end
		attr_reader :parent, :child
		alias :to_io :parent
		def fileno
			@parent.fileno
		end
	end
	
	class PTY < Composite
		def initialize(master, slave)
			@master, @slave = master, slave
		end
		attr_reader :master, :slave
		alias :to_io :master
		def to_ary
			[@master, @slave]
		end
		def fileno
			@master.fileno
		end
	end
end
