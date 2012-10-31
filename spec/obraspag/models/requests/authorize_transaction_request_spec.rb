require 'spec_helper'

describe Braspag::AuthorizeTransactionRequest do
    let(:request_object) {Braspag::AuthorizeTransactionRequest.new}
    let(:request_object_full) {
        request_object.request_id = "1234"
        request_object
    }

    it "should be invalid without attributes" do
      request_object.valid?.should be_false
    end

    it "should be invalid without attributes" do
      request_object.request_id = "1234"
      request_object.valid?.should be_true
    end

end
