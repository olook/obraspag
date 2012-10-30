module Braspag

  class AuthorizeTransactionRequest
    include ::ActiveAttr::Model

    attribute :request_id
    attribute :version
    attribute :order_data
    attribute :payment_data_collection
    attribute :customer_data

    attr_accessor :request_id, :version, :order_data, :payment_data_collection, :customer_data

    validates :request_id, {:presence => true}

    def initialize
      @order_data = Order.new
      @payment_data_collection = []
      @customer_data = Customer.new
      @version = CONTRACT_VERSION
    end

    def to_hash
      {
        "request" => {
          "RequestId" => self.request_id,
          "Version" =>self.version,
          "OrderData" => self.order_data.to_hash,
          "CustomerData" => self.customer_data,
          "PaymentDataCollection" => {
            "PaymentDataRequest" => { 
              "PaymentMethod" => "997",
              "Amount" => "500",
              "TransactionType" => "1",
              "Currency" => "BRL",
              "Country" => "BRA",
              "NumberOfPayments" => "1",
              "PaymentPlan" => "0",
              "TransactionType" => "1",
              "CardHolder" => "Comprador Teste",
              "CardNumber" => "0000000000000001",
              "CardSecurityCode" => "123",
              "CardExpirationDate" => "05/2018",
              "AdditionalDataCollection" => "",
              :attributes! => { "ins0:AdditionalDataCollection" => { "xsi:nil" => "true" } }
            },
            :attributes! => { 
              "ins0:PaymentDataRequest" => { "xsi:type" => "ins0:CreditCardDataRequest" }
            }
          }
        }
      }
    end
  end
end
