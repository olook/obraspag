require 'spec_helper'

describe Braspag::AuthorizeTransactionRequestBuilder do

  context "with valid build data" do

    builder = Braspag::AuthorizeTransactionRequestBuilder.new
    builder.with_request_id('1234')
      .with_order_number(1234)
      .with_payment_method(Braspag::PAYMENT_METHOD[:braspag])
      .with_customer_id(1)
      .with_customer_name('Teste')
      .with_customer_email('teste@olook.com.br')

    it "should build an AuthorizeTransactionRequest object" do
      builder.build.should_not be_nil
    end

  end

end