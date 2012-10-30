require 'spec_helper'

describe Braspag::CreditCard do
    context "on .authorize" do
      it "should validate minimum 1 length of holder_name" do
        subject.holder_name = ''
        subject.valid?(:authorize)
        subject.errors.messages[:holder_name].should include("is too short (minimum is 1 characters)")
      end

      it "should validate maximum 100 length of holder_name" do
        subject.holder_name = '*' * 110
        subject.valid?(:authorize)
        subject.errors.messages[:holder_name].should include("is too long (maximum is 100 characters)")
      end

      it "should not allow blank for number" do
        subject.number = ''
        subject.valid?(:authorize)
        subject.errors.messages[:number].should include("can't be blank")
      end

      it "should not allow blank for month" do
        subject.month = ''
        subject.valid?(:authorize)
        subject.errors.messages[:month].should include("can't be blank")
      end

      it "should not allow blank for year" do
        subject.year = ''
        subject.valid?(:authorize)
        subject.errors.messages[:year].should include("can't be blank")
      end

      it "should not allow invalid date for month & year" do
        subject.month = "14"
        subject.year = "2012"
        subject.valid?(:authorize)
        subject.errors.messages[:month].should include("invalid date")
        subject.errors.messages[:year].should include("invalid date")
      end

      it "should allow valid date for month & year" do
        subject.month = "09"
        subject.year = "12"
        subject.valid?(:authorize)
        subject.errors.messages[:month].should be(nil)
        subject.errors.messages[:year].should be(nil)
      end

      it "should allow valid date for month & year" do
        subject.month = 12
        subject.year = 2014
        subject.valid?(:authorize)
        subject.errors.messages[:month].should be(nil)
        subject.errors.messages[:year].should be(nil)
      end

      it "should allow valid security_code" do
        subject.security_code = 123
        subject.valid?(:authorize)
        subject.errors.messages[:security_code].should be(nil)
      end

      it "should not allow valid security_code empty" do
        subject.security_code = ''
        subject.valid?(:authorize)
        subject.errors.messages[:security_code].should include("can't be blank")
      end

      it "should allow valid number_of_payments" do
        subject.number_of_payments = 1
        subject.valid?(:authorize)
        subject.errors.messages[:number_of_payments].should be(nil)
      end

      it "should not allow valid number_of_payments empty" do
        subject.number_of_payments = ''
        subject.valid?(:authorize)
        subject.errors.messages[:number_of_payments].should include("can't be blank")
      end

      it "should allow valid payment_plan" do
        subject.payment_plan = 1
        subject.valid?(:authorize)
        subject.errors.messages[:payment_plan].should be(nil)
      end

      it "should not allow valid payment_plan empty" do
        subject.payment_plan = ''
        subject.valid?(:authorize)
        subject.errors.messages[:payment_plan].should include("can't be blank")
      end

    end
end
