module LFSR
	MAX_2 = 1<<1 | 1<<0
	MAX_3 = 1<<2 | 1<<1
	MAX_4 = 1<<3 | 1<<2
	MAX_5 = 1<<4 | 1<<2
	MAX_6 = 1<<5 | 1<<4
	MAX_7 = 1<<6 | 1<<5
	MAX_8 = 1<<7 | 1<<5 | 1<<4 | 1<<3
	MAX_9 = 1<<8 | 1<<4
	MAX_10 = 1<<9 | 1<<6
	MAX_11 = 1<<10 | 1<<8
	MAX_12 = 1<<11 | 1<<10 | 1<<9 | 1<<3
	MAX_13 = 1<<12 | 1<<11 | 1<<10 | 1<<7
	MAX_14 = 1<<13 | 1<<12 | 1<<11 | 1<<1
	MAX_15 = 1<<14 | 1<<13
	MAX_16 = 1<<15 | 1<<14 | 1<<12 | 1<<3
	MAX_17 = 1<<16 | 1<<13
	MAX_18 = 1<<17 | 1<<10
	MAX_19 = 1<<18 | 1<<17 | 1<<16 | 1<<13
	MAX_20 = 1<<19 | 1<<16
	MAX_21 = 1<<20 | 1<<18
	MAX_22 = 1<<21 | 1<<20
	MAX_23 = 1<<22 | 1<<17
	MAX_24 = 1<<23 | 1<<22 | 1<<21 | 1<<16
end

class LFSR::Galois
	VERSION = "0.1.0"


	@start_state : Int64
	@lfsr : Int64
	@taps : Int64
	def initialize( taps, start_state = 1 )
		@start_state = start_state.to_i64
		@lfsr = @start_state
		@taps = taps.to_i64
	end

	@period = 0
	def period()
		return @period if @period != 0

		orig_lfsr = @lfsr
		@lfsr = 1

		start = @lfsr
		@period = 1
		self.next()
		while @lfsr != start
		self.next()
			@period += 1
		end

		@lfsr = orig_lfsr
		@period
	end

	def next()
		lsb = @lfsr & 1
		@lfsr >>= 1
		@lfsr ^= @taps if lsb == 1
		@lfsr
	end
end
