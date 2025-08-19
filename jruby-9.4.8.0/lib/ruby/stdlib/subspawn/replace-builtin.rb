require 'subspawn'

module Kernel
	class << self
		alias :builtin_spawn :spawn
		def spawn(*args)
			SubSpawn.spawn_compat(*args)
		end
	end

	private
	alias :builtin_spawn :spawn
	def spawn(*args)
		SubSpawn.spawn_compat(*args)
	end
end

module Process
	class << self
		alias :builtin_spawn :spawn

		def spawn(*args)
			SubSpawn.spawn_compat(*args)
		end

		def subspawn(args, opt={})
			SubSpawn.spawn(args, opt)
		end
	end
end
