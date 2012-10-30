require 'spec_helper'

describe Braspag::Webservice do

  it "should instanciate with success" do
    Braspag::Webservice.new(:homolog).should_not be_nil
  end
end
