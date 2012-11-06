require 'spec_helper'

describe Braspag::Order do

  subject { s =  Braspag::Order.new(1234) }

	context "order validation" do

      it "should validate a valid order" do
        subject.valid?.should eq(true)
      end

	    it "should validate presence of number" do
	    	subject.number = nil
        subject.valid?.should eq(false)
	    end

	end

  context "generated hash validation" do
    let(:expected_hash) { {"MerchantId"=>"{84BE7E7F-698A-6C74-F820-AE359C2A07C2}", "OrderId"=>1234} }
    it "should generate the expected hash" do
      subject.to_hash.should eq(expected_hash)
    end
  end

end
