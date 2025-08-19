# frozen_string_literal: true

require 'ffi'

module SubSpawn
class POSIX
module PtyHelper
	class PtyIO < IO
		def inspect
			"#<IO:masterpty:#{@slave_path}>"
		end

		# Subspawn-specific feature
		attr_reader :slave_path

		private
		def __subspawn_init(name)
			# All other files are opened cloexec, this one isn't yet as it came from native code
			self.close_on_exec = true
			@slave_path = name.freeze
			self.sync = true
		end
	end

	def self.open_internal(chmod_for_open = false)
		m, s, name = Internal::OpenPTY.call

		# chmod the slave path, but only if were were called as ::open, not as ::spawn
		# I don't understand why, but doing this just to mirror MRI
		File.chmod(0o600, name) if chmod_for_open

		master = PtyIO.for_fd(m, IO::RDWR | IO::SYNC)
		master.send(:__subspawn_init, name)

		# we could shim the slave to be a fake file, or we could just re-open the path
		# which fixes #inspect, #tty?, #path, and #close_on_exec, all in one go
		# https://bugs.ruby-lang.org/issues/19036
		slave = File.open(name, IO::RDWR | IO::SYNC)
		slave.sync = true # still must do this manually though, as IO::SYNC seems to be mostly ignored
		Internal::OpenPTY.close(s)

		[master, slave, name]
	end

	def self.open
		*files, name = open_internal(true)
		return files unless block_given?

		begin
			return yield files.dup # Array, not splatted
		ensure
			files.reject(&:closed?).each(&:close)
		end
	end

end
end
end
