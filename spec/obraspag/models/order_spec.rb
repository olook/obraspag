require 'spec_helper'

describe Braspag::Order do

	context "order validation" do

    subject { Braspag::Order.new(1234) }

      it "should validate a valid order" do
        subject.valid?.should eq(true)
      end

	    it "should validate presence of number" do
	    	subject.number = nil
        subject.valid?.should eq(false)
	    end

	end

end
