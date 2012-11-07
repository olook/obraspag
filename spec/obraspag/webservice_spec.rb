require 'spec_helper'

describe Braspag::Webservice do
  let(:authorize)  { Braspag::Webservice.new(:homolog) }
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
    it "should call autorize_transaction with success" do
      pending
      authorize.authorize_transaction(authorize_request).should be_true
    end

  end

  context "on .checkout" do
      authorize_response_failure = {:authorize_transaction_response=>{:authorize_transaction_result=>{:correlation_id=>"00000000-0000-0000-0000-000000000000", :success=>false, :error_report_data_collection=>{:error_report_data_response=>[{:error_code=>"100", :error_message=>"RequestId is a mandatory parameter"}, {:error_code=>"107", :error_message=>"PaymentDataCollection is a mandatory item"}]}}, :@xmlns=>"https://www.pagador.com.br/webservice/pagador"}}

      authorize_response_success = {:authorize_transaction_response=>{:authorize_transaction_result=>{:correlation_id=>"00000000-0000-0000-0000-000000000007", :success=>true, :error_report_data_collection=>nil, :order_data=>{:order_id=>"45454545454545", :braspag_order_id=>"9bbdb10e-6566-4b34-9097-d595b67ce31d"}, :payment_data_collection=>{:payment_data_response=>{:braspag_transaction_id=>"a744d7c2-754a-4b26-94dd-e7f1435976ca", :payment_method=>"997", :amount=>"500", :acquirer_transaction_id=>"1031064345046", :authorization_code=>"20121031064345046", :return_code=>"4", :return_message=>"Operation Successful", :status=>"1", :credit_card_token=>nil, :"@xsi:type"=>"CreditCardDataResponse"}}}, :@xmlns=>"https://www.pagador.com.br/webservice/pagador"}}

      capture_response_success = {:capture_credit_card_transaction_response=>{:capture_credit_card_transaction_result=>{:correlation_id=>"00000000-0000-0000-0000-000000000007", :success=>true, :error_report_data_collection=>nil, :transaction_data_collection=>{:transaction_data_response=>{:braspag_transaction_id=>"a744d7c2-754a-4b26-94dd-e7f1435976ca", :acquirer_transaction_id=>"1031064345046", :amount=>"500", :authorization_code=>"20121031065744906", :return_code=>"6", :return_message=>"Operation Successful", :status=>"0"}}}, :@xmlns=>"https://www.pagador.com.br/webservice/pagador"}}

      it "should not call capture when authorize returns success false" do
        authorize.stub(:authorize_transaction).and_return(authorize_response_failure)
        authorize.checkout(authorize_request).should_not_receive(:capture_credit_card_transaction)
     end

      it "should call capture when authorize returns success true" do
        authorize.stub(:authorize_transaction).and_return(authorize_response_success)
        authorize.stub(:capture_credit_card_transaction).and_return(capture_response_success)
        authorize.checkout(authorize_request).should eq({:authorize_response => authorize_response_success, :capture_response => capture_response_success})
     end

     it "should call capture with the correct request data" do
      credit_card_request = Braspag::CreditCardTransactionRequest.new
      authorize.stub(:authorize_transaction).and_return(authorize_response_success)
      authorize.stub(:create_capture_credit_card_request).and_return(credit_card_request)
      authorize.should_receive(:capture_credit_card_transaction).with(credit_card_request).and_return(capture_response_success)
      authorize.checkout(authorize_request).should eq({:authorize_response => authorize_response_success, :capture_response => capture_response_success})
     end

  end

  context "on create_capture_credit_card_request" do
    authorize_response = {:authorize_transaction_response=>{:authorize_transaction_result=>{:correlation_id=>"00000000-0000-0000-0000-000000000007", :success=>true, :error_report_data_collection=>nil, :order_data=>{:order_id=>"45454545454545", :braspag_order_id=>"9bbdb10e-6566-4b34-9097-d595b67ce31d"}, :payment_data_collection=>{:payment_data_response=>{:braspag_transaction_id=>"a744d7c2-754a-4b26-94dd-e7f1435976ca", :payment_method=>"997", :amount=>"500", :acquirer_transaction_id=>"1031064345046", :authorization_code=>"20121031064345046", :return_code=>"4", :return_message=>"Operation Successful", :status=>"1", :credit_card_token=>nil, :"@xsi:type"=>"CreditCardDataResponse"}}}, :@xmlns=>"https://www.pagador.com.br/webservice/pagador"}}


    it "should create the request object with correct transaction request" do
      request = authorize.send(:create_capture_credit_card_request, authorize_response)
      request.transaction_data_collection[0]["TransactionDataRequest"]["BraspagTransactionId"].should eq("a744d7c2-754a-4b26-94dd-e7f1435976ca")
      request.transaction_data_collection[0]["TransactionDataRequest"]["Amount"].should eq("500")
    end

    it "should create the request object with correct request_id" do
      request = authorize.send(:create_capture_credit_card_request, authorize_response)
      request.request_id.should eq("00000000-0000-0000-0000-000000000007")
    end

  end


end
