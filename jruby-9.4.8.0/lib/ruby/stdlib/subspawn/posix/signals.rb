class SubSpawn::POSIX::SigSet
	def initialize(base=:empty)
		base = base.to_sym
		raise ArgumentError, "SigSet only accepts :full, :empty, or :current" unless %i{full empty current}.include? base
		# TODO: warn about current?
		@base = base
		@ops = []
		@ptr = nil
	end
	def self.empty
		self.new(:empty)
	end
	def self.full
		self.new(:full)
	end
	def self.current
		self.new(:current)
	end
	def include(*signals)
		clean_signals(signals).each do |sig|
			@ops << [:add, sig]
		end
		self
	end
	def exclude(*signals)
		clean_signals(signals).each do |sig|
			@ops << [:rm, sig]
		end
		self
	end
	alias :- :exclude
	alias :+ :include
	alias :add :exclude
	alias :del :include
	alias :delete :include

	def to_ptr(&block)
		if @ptr.nil?
			# sigset_t is largest on linux, at 128 bytes, so always allocate that much
			if block_given?
				ret = nil
				FFI::MemoryPointer.new(:uint8, 128) {|ptr| alloc_internal(ptr); ret = block.call(ptr)}
				ret
			else
				FFI::MemoryPointer.new(:uint8, 128).tap {|ptr| @ptr = ptr; alloc_internal(ptr)}
			end
		else
			if block_given?
				block.call(@ptr)
			else
				@ptr
			end
		end
	end
	private
	def clean_signals(signals)
		signals.flatten.map do |sig|
			if Integer === sig
				sig
			else
				Signal.list[sig.to_s.upcase].tap do |good|
					raise ArgumentError, "#{sig} cannot be converted to a signal" if good.nil?
				end
			end 
		end
	end
	def alloc_internal ptr
		sig = SubSpawn::POSIX::Internal::SignalFn
		case @base
		when :full then sig.fillset(ptr)
		when :empty then sig.emptyset(ptr)
		when :current
			sig.emptyset(ptr)
			sig.mask(0, nil, ptr) # get the current (old) set
		else raise "Invalid State"
		end
		@ops.each do |op, num|
			if op == :add
				sig.addset(ptr, num)
			else
				sig.delset(ptr, num)
			end
		end
	end
end
