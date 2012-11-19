require 'spec_helper'

describe Braspag::AuthorizeTransactionRequest do
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
       authorize_request.to_hash.should eq(
        {"request" => { 
          :request_id =>"00000000-0000-0000-0000-000000000000", 
          :version =>"1.9", 
          :order_data => { 
            :merchant_id =>"{84BE7E7F-698A-6C74-F820-AE359C2A07C2}", 
            :order_id =>"123"
          }, 
          :customer_data => {
            :customer_identity =>"1", 
            :customer_name =>"Matheus", 
            :customer_email =>"matheus.bodo@olook.com.br", 
            :customer_address_data =>{
              :street =>"Rua surubim", 
              :number =>"159", 
              :complement =>"", 
              :district =>"SP", 
              :zip_code =>"08730810", 
              :city =>"Sao Paulo", 
              :state =>"SP", 
              :country =>"BR"
            }, 
            :delivery_address_data =>{
              :street =>"Rua surubim", 
              :number =>"159", 
              :complement =>"", 
              :district =>"SP", 
              :zip_code =>"08730810", 
              :city =>"Sao Paulo", 
              :state =>"SP", 
              :country =>"BR"
            }
          }, 
          :payment_data_collection =>[]
        }
      })
    end

end
