module Braspag
  class AuthorizeTransactionRequestBuilder

    def initialize
      @authorize_transaction_request = Braspag::AuthorizeTransactionRequest.new
    end

    def build
      if @authorize_transaction_request.valid?
        @authorize_transaction_request
      else
        raise 'Authorize Transaction Request is invalid.'
      end
    end

    def with_request_id(request_id)
      @authorize_transaction_request.request_id = request_id
      self
    end

    def with_order_number(order_number)
      @authorize_transaction_request.order.order_number = order_number
    end
  end
end