require 'spec_helper'

describe Braspag::AuthorizeTransactionRequest do

    it "should create with correct params" do
        request_object = Braspag::AuthorizeTransactionRequest.build_request_object
        request_object.should be_an_instance_of(Braspag::AuthorizeTransactionRequest)
    end

end
