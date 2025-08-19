# frozen_string_literal: true

module LFP
	module LFPFile
		def self.local_so
			list = []
			list += ENV["LIBFIXPOSIX_PATH"].split(";;") if ENV["LIBFIXPOSIX_PATH"]
			list << "fixposix"
			list
		end
	end
end
begin
	require "libfixposix/binary"
rescue LoadError
	# no binary installed, use system wide or ENV var
end
require_relative "./libfixposix/ffi"

# Extract bound version
module LFP
	VERSION = "#{LFP::INTERFACE_VERSION}.0"	
	Buildinfo.new.tap {|ptr|
		LFP.buildinfo(ptr)
		SO_VERSION = [ptr[:release]].pack("L").unpack("ccc").reverse.join(".")
	}
	COMPLETE_VERSION = {
		gem: LFP::VERSION,
		interface: LFP::INTERFACE_VERSION,
		library: LFP::SO_VERSION,
	}
	if defined? LFP::Binary
		COMPLETE_VERSION[:binary] = {
			gem: LFP::Binary::GEM_VERSION,
			interface: LFP::Binary::API_VERSION,
			library: LFP::Binary::SO_VERSION,
		}
	end
end
