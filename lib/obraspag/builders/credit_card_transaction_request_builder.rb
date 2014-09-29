module Braspag
  class CreditCardTransactionRequestBuilder

    def initialize(env='test')
      @credit_card_transaction_request = Braspag::CreditCardTransactionRequest.new(env)
    end

    def build
      raise "Credit Card Transaction Request is invalid, Error: #{@credit_card_transaction_request.errors.inspect}." unless @credit_card_transaction_request.valid?
      raise "Credit Card Transaction Data Collection is empty." if @credit_card_transaction_request.transaction_data_collection.empty?
      @credit_card_transaction_request
    end

    def with_request_id(request_id)
      @credit_card_transaction_request.request_id = request_id
      self
    end

    def with_transaction_request(transaction_request)
      @credit_card_transaction_request.transaction_data_collection << transaction_request.to_hash
      self
    end
  end
end
