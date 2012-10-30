require 'spec_helper'

describe Braspag::OrderBuilder do

  context "with valid build data" do
    subject { complete_builder }

    it "should build an Order object" do
      subject.build.should_not be_nil
    end

  end

  context "with invalid build data" do
    subject { complete_builder }

    it "should raise exception when Order is not valid" do
      subject.with_order_number(nil)
      expect { subject.build }.to raise_error
    end

    it "should raise exception when Customer is not valid" do
      subject.for_customer(nil)
      expect { subject.build }.to raise_error
    end

  end

  def complete_builder
    builder = Braspag::OrderBuilder.new
    builder.with_order_number(1234)
    .with_payment_method(Braspag::PAYMENT_METHOD[:braspag])
    .for_customer(customer_builder.build)
    builder
  end

  def customer_builder
    builder = Braspag::CustomerBuilder.new
    builder.with_customer_id(1)
    .with_customer_name('Teste')
    .with_customer_email('teste@olook.com.br')
    builder
  end

end