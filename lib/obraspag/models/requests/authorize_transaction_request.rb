module Braspag

  class AuthorizeTransactionRequest
    include ::ActiveAttr::Model
    attr_accessor :request_id, :version, :order_data, :payment_data_collection, :customer_data

    validates :request_id, {:presence => true}

    def initialize
      @order_data = []
      @payment_data_collection = []
      @customer_data = []
      @version = "VERSAO IRA AQUI"
    end

  end
end
