class AuthorizeTransactionRequest
    attr_accessor :request_id, :version

    def initialize
        @order_data = []
        @payment_data_collection = []
        @customer_data = []
    end
end
