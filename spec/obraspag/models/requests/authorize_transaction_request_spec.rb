require 'spec_helper'
require 'factories'

describe Braspag::AuthorizeTransactionRequest do
  let(:order) {orderrr}
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
    let(:request_object) {Braspag::AuthorizeTransactionRequest.new}
    let(:request_object_full) {
        request_object.request_id = "00000000-0000-0000-0000-000000000000"
        request_object
    }

    it "should be invalid without attributes" do
      request_object.valid?.should be_false
    end

    it "should be invalid without attributes" do
      request_object_full.valid?.should be_true
    end

    it "should create a hash" do
       authorize_request.to_hash.should eq({"request"=>{"RequestId"=>"00000000-0000-0000-0000-000000000000", "Version"=>"1.9", "OrderData"=>{"MerchantId"=>"540BA6EE-39D7-3DC1-D87D-7F82C49A3598", "OrderId"=>"123"}, "CustomerData"=>{"CustomerIdentity"=>"1", "CustomerName"=>"Matheus", "CustomerEmail"=>"matheus.bodo@olook.com.br", "CustomerAddressData"=>{"Street"=>"Rua surubim", "Number"=>"159", "Complement"=>"", "District"=>"SP", "ZipCode"=>"08730810", "City"=>"Sao Paulo", "State"=>"SP", "Country"=>"BR"}, "DeliveryAddressData"=>{"Street"=>"Rua surubim", "Number"=>"159", "Complement"=>"", "District"=>"SP", "ZipCode"=>"08730810", "City"=>"Sao Paulo", "State"=>"SP", "Country"=>"BR"}}, "PaymentDataCollection"=>[]}})
    end

end
