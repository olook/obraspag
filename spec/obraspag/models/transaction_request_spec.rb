require 'spec_helper'

describe Braspag::TransactionRequest do

  subject { Braspag::TransactionRequest.new(123, "123")  }

  context "customer validation" do

      it "should validate a valid transaction request" do
        subject.valid?.should eq(true)
      end

      it "should validate presence of braspag transaction id" do
        subject.braspag_transaction_id = nil
        subject.valid?.should eq(false)
      end

  end

  context "generated hash validation" do
    let(:expected_hash) {{"TransactionDataRequest"=>{"BraspagTransactionId"=>123, "Amount"=>"123"}}}
    it "should generate the expected hash" do
      subject.to_hash.should eq(expected_hash)
    end
  end

end
