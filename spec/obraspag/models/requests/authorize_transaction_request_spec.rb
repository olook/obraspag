require 'spec_helper'

describe Braspag::AuthorizeTransactionRequest do

  it "should create with correct params" do
      subject.build_request_object.should be_valid
  end

end
