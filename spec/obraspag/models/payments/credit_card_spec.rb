require 'spec_helper'

describe Braspag::CreditCard do
    context "on .authorize" do
      it "should validate minimum 1 length of holder_name" do
        subject.holder_name = ''
        subject.valid?(context_type)
        subject.errors.messages[:holder_name].should include("is too short (minimum is 1 characters)")
      end

      it "should validate maximum 100 length of holder_name" do
        subject.holder_name = '*' * 110
        subject.valid?(context_type)
        subject.errors.messages[:holder_name].should include("is too long (maximum is 100 characters)")
      end

      it "should not allow blank for number" do
        subject.number = ''
        subject.valid?(context_type)
        subject.errors.messages[:number].should include("can't be blank")
      end

      it "should not allow blank for month" do
        subject.month = ''
        subject.valid?(context_type)
        subject.errors.messages[:month].should include("can't be blank")
      end

      it "should not allow blank for year" do
        subject.year = ''
        subject.valid?(context_type)
        subject.errors.messages[:year].should include("can't be blank")
      end

      it "should not allow invalid date for month & year" do
        subject.month = "14"
        subject.year = "2012"
        subject.valid?(context_type)
        subject.errors.messages[:month].should include("invalid date")
        subject.errors.messages[:year].should include("invalid date")
      end

      it "should allow valid date for month & year" do
        subject.month = "09"
        subject.year = "12"
        subject.valid?(context_type)
        subject.errors.messages[:month].should be(nil)
        subject.errors.messages[:year].should be(nil)
      end

      it "should allow valid date for month & year" do
        subject.month = 12
        subject.year = 2014
        subject.valid?(context_type)
        subject.errors.messages[:month].should be(nil)
        subject.errors.messages[:year].should be(nil)
      end
    end
end
