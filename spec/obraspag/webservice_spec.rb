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
                  customer
  }
  let(:authorize_request) {
    authorize_request = Braspag::AuthorizeTransactionRequest.new
    authorize_request.request_id = "123"
    authorize_request.order_data = order
    authorize_request.order_data = customer
    authorize_request
  }

  it "should instanciate with success" do
    Braspag::Webservice.new(:homolog).should_not be_nil
  end
end
