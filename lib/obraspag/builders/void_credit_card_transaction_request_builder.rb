module Braspag

  class VoidCreditCardTransactionRequestBuilder

    def initialize
      @void_credit_card_transaction_request = VoidCreditCardTransactionRequest.new
    end

    def build
     raise 'Void Credit Card Transaction Request is invalid.' unless @void_credit_card_transaction_request.valid?
     raise 'Void Credit Card Transaction Data Collection is empty.' if @void_credit_card_transaction_request.transaction_data_collection.empty?
     @void_credit_card_transaction_request
    end

    def with_request_id(request_id)
      @void_credit_card_transaction_request.request_id = request_id
      self
    end

    def add_transaction_data_collection(transactions_data)
      @void_credit_card_transaction_request.transaction_data_collection << transactions_data
      self
    end
  end
end
