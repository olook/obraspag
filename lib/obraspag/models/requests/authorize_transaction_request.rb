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
      @payment_data_collection = Payment.new
      @customer_data = Customer.new
      @version = CONTRACT_VERSION
    end

    def to_hash
      #TODO: "ins0:CreditCardDataRequest" ???
      {
        "request" => {
          "RequestId" => self.request_id,
          "Version" =>self.version,
          "OrderData" => self.order_data.to_hash,
          "CustomerData" => self.customer_data.to_hash,
          "PaymentDataCollection" => self.payment_data_collection.to_hash,
            :attributes! => { 
              "ins0:PaymentDataRequest" => { "xsi:type" => "ins0:CreditCardDataRequest" }
            }
          }
        }
      }
    end
  end
end
