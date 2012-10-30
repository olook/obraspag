module Braspag
    class AuthorizeTransactionRequest
        attr_accessor :request_id, :version, :order_data, :payment_data_collection, :customer_data

        def initialize
            @order_data = []
            @payment_data_collection = []
            @customer_data = []
        end
    end
end
