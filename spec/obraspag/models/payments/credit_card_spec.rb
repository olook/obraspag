require 'spec_helper'

describe Braspag::CreditCard do
  context "on .to_hash" do
    it "should validate minimum 1 length of holder_name" do
      subject.holder_name = ''
      subject.valid?(:to_hash)
      subject.errors.messages[:holder_name].should include("is too short (minimum is 1 characters)")
    end

    it "should validate maximum 100 length of holder_name" do
      subject.holder_name = '*' * 110
      subject.valid?(:to_hash)
      subject.errors.messages[:holder_name].should include("is too long (maximum is 100 characters)")
    end

    it "should not allow blank for number" do
      subject.card_number = ''
      subject.valid?(:to_hash)
      subject.errors.messages[:card_number].should include("can't be blank")
    end

    it "should not allow blank for month" do
      subject.expiration_month = ''
      subject.valid?(:to_hash)
      subject.errors.messages[:expiration_month].should include("can't be blank")
    end

    it "should not allow blank for year" do
      subject.expiration_year = ''
      subject.valid?(:to_hash)
      subject.errors.messages[:expiration_year].should include("can't be blank")
    end

    it "should not allow invalid date for month & year" do
      subject.expiration_month = "14"
      subject.expiration_year = "2012"
      subject.valid?(:to_hash)
      subject.errors.messages[:expiration_month].should include("invalid date")
      subject.errors.messages[:expiration_year].should include("invalid date")
    end

    it "should allow valid date for month & year" do
      subject.expiration_month = "09"
      subject.expiration_year = "12"
      subject.valid?(:to_hash)
      subject.errors.messages[:expiration_month].should be(nil)
      subject.errors.messages[:expiration_year].should be(nil)
    end

    it "should allow valid date for month & year" do
      subject.expiration_month = 12
      subject.expiration_year = 2014
      subject.valid?(:to_hash)
      subject.errors.messages[:expiration_month].should be(nil)
      subject.errors.messages[:expiration_year].should be(nil)
    end

    it "should allow valid security_code" do
      subject.security_code = 123
      subject.valid?(:to_hash)
      subject.errors.messages[:security_code].should be(nil)
    end

    it "should not allow valid security_code empty" do
      subject.security_code = ''
      subject.valid?(:to_hash)
      subject.errors.messages[:security_code].should include("can't be blank")
    end

    it "should allow valid number_of_payments" do
      subject.number_of_payments = 1
      subject.valid?(:to_hash)
      subject.errors.messages[:number_of_payments].should be(nil)
    end

    it "should not allow valid number_of_payments empty" do
      subject.number_of_payments = ''
      subject.valid?(:to_hash)
      subject.errors.messages[:number_of_payments].should include("can't be blank")
    end

    it "should allow valid payment_plan" do
      subject.payment_plan = 1
      subject.valid?(:to_hash)
      subject.errors.messages[:payment_plan].should be(nil)
    end

    it "should not allow valid payment_plan empty" do
      subject.payment_plan = ''
      subject.valid?(:to_hash)
      subject.errors.messages[:payment_plan].should include("can't be blank")
    end

  end
end
