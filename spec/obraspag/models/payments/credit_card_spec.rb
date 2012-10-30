require 'spec_helper'

describe Braspag::CreditCard do
    subject = CreditCard.new
    context "#validate_date" do
        subject.year = 2012
        subject.month = 01
        it "should receive an error" do
            subject.receive("invalid date")
            subject.send(:validate_date)
        end
    end
end
