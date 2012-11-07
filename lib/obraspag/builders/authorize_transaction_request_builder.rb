module Braspag
  class AuthorizeTransactionRequestBuilder

    def initialize
      @authorize_transaction_request = Braspag::AuthorizeTransactionRequest.new
    end

    def build
      raise "Authorize Transaction Request is invalid, Error: #{@authorize_transaction_request.errors.inspect}.." unless @authorize_transaction_request.valid?
      raise "Order data is invalid, Error: #{@authorize_transaction_request.order_data.errors.inspect}.." unless @authorize_transaction_request.order_data.valid?
      raise "Customer data is invalid, Error: #{@authorize_transaction_request.customer_data.errors.inspect}.." unless @authorize_transaction_request.customer_data.valid?
      @authorize_transaction_request
    end

    def with_request_id(request_id)
      @authorize_transaction_request.request_id = request_id
      self
    end

    def for_order(order)
      @authorize_transaction_request.order_data = order
      self
    end

    def for_customer(customer)
      @authorize_transaction_request.customer_data = customer
      self
    end

    def with_payment_request(payment_request)
      @authorize_transaction_request.payment_data_collection << payment_request.to_hash
      self
    end

  end
end
