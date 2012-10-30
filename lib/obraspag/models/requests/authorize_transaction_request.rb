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
      @customer_data = []
      @version = CONTRACT_VERSION
    end

    def to_hash
      "TESTE"
    end
  end
end
