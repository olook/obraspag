module Braspag

  class AuthorizeTransactionRequest

    include ::ActiveAttr::Model
    attribute :version 
    attribute :order_data
    attribute :payment_data_collection
    attribute :customer_data
    attribute :request_id
    validates :request_id, {:presence => true}

    def initialize
      self.order_data = Order.new
      self.payment_data_collection = []
      self.customer_data = []
      self.version = '1.0'
    end

  end
end
