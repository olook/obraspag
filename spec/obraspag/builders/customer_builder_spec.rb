require 'spec_helper'

describe Braspag::CustomerBuilder do

  context "with valid build data" do
    subject { complete_builder }

    it "should build a Customer object" do
      subject.build.should_not be_nil
    end

  end

  context "with invalid build data" do
    subject { complete_builder }

    it "should raise exception when Customer is not valid" do
      subject.with_customer_id(nil)
      expect { subject.build }.to raise_error
    end

  end

  def complete_builder
    builder = Braspag::CustomerBuilder.new
    builder.with_customer_id(1)
    .with_customer_name('Teste')
    .with_customer_email('teste@olook.com.br')
    builder
  end

end