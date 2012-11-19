require 'spec_helper'

describe Braspag::CreditCardTransactionRequest do
  let(:transaction_data) {Braspag::TransactionRequest.new("11111111-1111-1111-1111-111111111111")}

  let(:authorize_request) {
    void_object = Braspag::CreditCardTransactionRequest.new
    void_object.request_id = "00000000-0000-0000-0000-000000000000"
    void_object.transaction_data_collection << transaction_data
    void_object
  }

  let(:subject_with_request_id) {
    subject.request_id = "00000000-0000-0000-0000-000000000000"
    subject
  }

    it "should be invalid without attributes" do
      subject.valid?.should be_false
    end

    it "should be invalid without attributes" do
      subject_with_request_id.valid?.should be_true
    end

    it "should create a hash" do
       authorize_request.to_hash.should eq( { 
        "request" => {
          :request_id =>"00000000-0000-0000-0000-000000000000", 
          :version =>"1.9", 
          :merchant_id =>"{84BE7E7F-698A-6C74-F820-AE359C2A07C2}", 
          :transaction_data_collection =>[transaction_data]
        }
      } )
    end

end
