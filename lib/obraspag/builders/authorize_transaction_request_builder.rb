module Braspag
  class AuthorizeTransactionRequestBuilder

    def initialize
      @authorize_transaction_request = Braspag::AuthorizeTransactionRequest.new
    end

    def build
      raise 'Authorize Transaction Request is invalid.' unless @authorize_transaction_request.valid?
      raise 'Order data is invalid.' unless @authorize_transaction_request.order_data.valid?
      raise 'Customer data is invalid.' unless @authorize_transaction_request.order_data.customer.valid?
      @authorize_transaction_request
    end

    def with_request_id(request_id)
      @authorize_transaction_request.request_id = request_id
      self
    end

    def with_order_number(order_number)
      @authorize_transaction_request.order_data.order_number = order_number
      self
    end

    def with_payment_method(payment_method)
      @authorize_transaction_request.order_data.payment_method = payment_method
      self
    end

    def with_customer_id(customer_id)
      @authorize_transaction_request.order_data.customer.id = customer_id
      self
    end

    def with_customer_name(customer_name)
      @authorize_transaction_request.order_data.customer.name = customer_name
      self
    end

    def with_customer_email(customer_email)
      @authorize_transaction_request.order_data.customer.email = customer_email
      self
    end

  end
end