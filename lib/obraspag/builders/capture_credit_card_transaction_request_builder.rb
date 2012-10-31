module Braspag
  class CaptureCreditCardTransactionRequestBuilder

    def initialize
      @capture_credit_card_transaction_request = Braspag::CaptureCreditCardTransactionRequest.new
    end

    def build
      raise 'Capture Transaction Request is invalid.' unless @capture_credit_card_transaction_request.valid?
      @capture_credit_card_transaction_request
    end

    def with_request_id(request_id)
      @capture_credit_card_transaction_request.request_id = request_id
      self
    end

    def with_transaction_request(transaction_request)
      @capture_credit_card_transaction_request.transaction_data_collection << transaction_request.to_hash
      self
    end
  end
end