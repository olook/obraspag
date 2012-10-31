require 'spec_helper'

describe Braspag::Webservice do
  let(:order) {Braspag::Order.new("123")}
  let(:customer_address) {address = Braspag::Address.new
                          address.street = "Rua surubim"
                          address.number = "159"
                          address.complement = ""
                          address.district = "SP"
                          address.zip_code = "08730810"
                          address.city = "Sao Paulo"
                          address.state = "SP"
                          address.country = "BR"
                          address
  }
  let(:customer) {customer = Braspag::Customer.new
                  customer.id = "1"
                  customer.name = "Matheus"
                  customer.email = "matheus.bodo@olook.com.br"
                  customer.customer_address = customer_address
                  customer.delivery_address = customer_address
                  customer
  }
  let(:authorize_request) {
    authorize_request = Braspag::AuthorizeTransactionRequest.new
    authorize_request.request_id = "00000000-0000-0000-0000-000000000000"
    authorize_request.order_data = order
    authorize_request.customer_data = customer
    authorize_request
  }

  context "on .new" do
      it "should instanciate with success" do
        Braspag::Webservice.new(:homolog).should_not be_nil
      end
  end

  context "should call authorize_request" do
    let(:authorize)  { Braspag::Webservice.new(:homolog) }
    hash1 = {:authorize_transaction_response=>{:authorize_transaction_result=>{:correlation_id=>"00000000-0000-0000-0000-000000000000", :success=>false, :error_report_data_collection=>{:error_report_data_response=>[{:error_code=>"100", :error_message=>"RequestId is a mandatory parameter"}, {:error_code=>"107", :error_message=>"PaymentDataCollection is a mandatory item"}]}}, :@xmlns=>"https://www.pagador.com.br/webservice/pagador"}}
    hash2 = {  }
    it "should call autorize_transaction with success" do
      pending
      authorize.authorize_transaction(authorize_request).should be_true
    end

    it "should call authorize_request and"

    it "should call authorize_transaction and capture transaction on the same method" do
        binding.pry
        authorize.checkout(authorize_request).should eq([hash1, hash2])
    end
  end


end
