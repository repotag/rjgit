require 'subspawn'

$_ss_overwrite = defined? PTY

module PTY
	unless $_ss_overwrite
		class ChildExited < RuntimeError
			def initialize(status)
				@status = status
			end
			attr_reader :status
		end
	end
	class << self
		if $_ss_overwrite
			alias :builtin_spawn :spawn
			alias :builtin_getpty :getpty
		end

		def spawn(*args, &block)
			SubSpawn.pty_spawn_compat(*args, &block)
		end
		def subspawn(command, opts={}, &block)
			SubSpawn.pty_spawn(command, opts, &block)
		end
		alias :getpty :spawn

		def open(&blk)
			SubSpawn::Platform::PtyHelper.open(&blk)
		end

		def check(pid, do_raise=false)
			return if Process.waitpid(pid, Process::WNOHANG | Process::WUNTRACED).nil?
			return $? unless do_raise
			raise ::PTY::ChildExited.new($?)
		end
	end
end

$_ss_overwrite = nil
