require 'ffi'

module SubSpawn::POSIX::Internal
	module SignalFn
		extend FFI::Library
		ffi_lib FFI::Library::LIBC

		attach_function :emptyset, :sigemptyset, [:pointer], :int
		attach_function :fillset, :sigfillset, [:pointer], :int
		attach_function :addset, :sigaddset, [:pointer, :int], :int
		attach_function :delset, :sigdelset, [:pointer, :int], :int
		attach_function :ismember, :sigismember, [:pointer, :int], :int


		ffi_lib %w{pthread.so.0 pthread pthread.dylib}

		attach_function :mask, :pthread_sigmask, %i{int pointer pointer}, :int
	end

	module OpenPTY
		extend FFI::Library

		ffi_lib FFI::Platform.mac? ? FFI::Library::LIBC : ["libutil.so.1", "util"]
		attach_function :openpty, [:buffer_out, :buffer_out, :buffer_out, :buffer_in, :buffer_in], :int

		ffi_lib FFI::Library::LIBC
		attach_function :close, [:int], :int

		def self.call(termios: nil, winsize: nil)
			FFI::MemoryPointer.new(:int, 2) do |fds|
				FFI::MemoryPointer.new(:char, 4096) do |name| # max on linux = 4096
					ret = self.openpty(fds[0], fds[1], name, termios, winsize)
					raise SystemCallError.new("OpenPTY Error", LFP.errno) unless ret == 0
					return [*fds.read_array_of_int(2), name.read_string]
				end
			end
		end
	end
end
