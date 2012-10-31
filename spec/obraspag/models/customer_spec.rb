require 'spec_helper'

describe Braspag::Customer do

  subject { 
    s =  Braspag::Customer.new
    s.id = 1
    s.name = "abc"
    s.email = "jao@olook.com.br"
    s.customer_address = Braspag::Address.new
    s.delivery_address = Braspag::Address.new
    s
  }

  context "customer validation" do

      it "should validate a valid customer" do
        subject.valid?.should eq(true)
      end

      it "should validate presence of id" do
        subject.id = nil
        subject.valid?.should eq(false)
      end

      it "should validate presence of name" do
        subject.name = nil
        subject.valid?.should eq(false)
      end

      it "should validate presence of email" do
        subject.email = nil
        subject.valid?.should eq(false)
      end

  end

  context "generated hash validation" do
    let(:expected_hash) { {"CustomerIdentity"=>"1", "CustomerName"=>"abc", "CustomerEmail"=>"jao@olook.com.br", "CustomerAddressData"=>{"Street"=>nil, "Number"=>nil, "Complement"=>nil, "District"=>nil, "ZipCode"=>nil, "City"=>nil, "State"=>nil, "Country"=>nil}, "DeliveryAddressData"=>{"Street"=>nil, "Number"=>nil, "Complement"=>nil, "District"=>nil, "ZipCode"=>nil, "City"=>nil, "State"=>nil, "Country"=>nil}} }
    it "should generate the expected hash" do
      subject.to_hash.should eq(expected_hash)
    end
  end

end
