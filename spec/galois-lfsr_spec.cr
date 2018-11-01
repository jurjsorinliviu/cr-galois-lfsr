require "./spec_helper"

describe LFSR::Galois do
  # TODO: Write tests

	describe "period" do
		{% for i in 2...24 %}
			it "calculates the LFSR period for a MAX_{{i.id}} sequence correctly" do
				l = LFSR::Galois.new( LFSR::MAX_{{i.id}} )
				l.period.should eq(2**{{i.id}}-1)
			end
		{% end %}
	end
end
