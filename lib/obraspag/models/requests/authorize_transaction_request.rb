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
      @version = CONTRACT_VERSION
    end

    def to_hash
      {
        "request" => {
          "RequestId" => self.request_id,
          "Version" =>self.version,
          "OrderData" => self.order_data.to_hash,
          "CustomerData" => self.customer_data.to_hash,
          "PaymentDataCollection" =>  self.payment_data_collection.to_hash
        }
      }
    end
  end
end
