# frozen_string_literal: true
require 'ffi'
require 'libfixposix/binary/version'

module LFP
	module Binary

		# TODO: we do depend on ffi-bindings, but they depend on us. 
		# make this one-off check class to avoid circular dependencies
		module InternalLocalCheck
			extend FFI::Library
			ffi_lib(PATH)
			class Buildinfo < FFI::Struct
				layout :release, :uint64, # unsigned long int release;
					:vcsid, [:uint8, 33] # char vcsid[32 + 1];
			end
			attach_function :buildinfo, :lfp_buildinfo, [Buildinfo.by_ref], :int32
		end
		InternalLocalCheck::Buildinfo.new.tap {|ptr|
			InternalLocalCheck.buildinfo(ptr)
			SO_VERSION = [ptr[:release]].pack("L").unpack("ccc").reverse.join(".")
		}
	end
end

# now configure
ENV["LIBFIXPOSIX_PATH"] = ((ENV["LIBFIXPOSIX_PATH"]&.split(";;") || []) + [LFP::Binary::PATH]).uniq.join(";;")
