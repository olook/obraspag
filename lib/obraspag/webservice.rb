module Braspag
  class Webservice

    def initialize(env)
            @connection = Braspag::Connection.new(env)
    end

    def authorize_transaction(authorize_transaction_request)
            call_webservice(:authorize_transaction, authorize_transaction_request)
    end

    def capture_credit_card_transaction(capture_credit_card_transaction_request)
            call_webservice(:capture_credit_card_transaction, capture_credit_card_transaction_request)
    end

    def void_credit_card_transaction(void_credit_card_transaction_request)
            call_webservice(:void_credit_card_transaction, void_credit_card_transaction_request)
    end

    def refund_credit_card_transaction(refund_credit_card_transaction_request)
            call_webservice(:refund_credit_card_transaction, refund_credit_card_transaction_request)
    end

    def checkout(authorize_transaction_request)
        authorize_response = authorize_transaction(authorize_transaction_request)
        checkout_response(authorize_response)
    end

    private

    def checkout_response(authorize_response)
      if response_success?(authorize_response)
          capture_request = create_capture_credit_card_request(authorize_response)
          capture_response = capture_credit_card_transaction(capture_request)
          [authorize_response, capture_response]
      else
          authorize_response
      end
    end

    def response_success?(authorize_response)
        authorize_response[:authorize_transaction_response][:authorize_transaction_result][:success]
    end

    def create_capture_credit_card_request(authorize_response)
      braspag_transaction_id = authorize_response[:authorize_transaction_response][:authorize_transaction_result][:payment_data_collection][:payment_data_response][:braspag_transaction_id]
      amount = authorize_response[:authorize_transaction_response][:authorize_transaction_result][:payment_data_collection][:payment_data_response][:amount]
      request_id = authorize_response[:authorize_transaction_response][:authorize_transaction_result][:correlation_id]
      transaction_request = Braspag::TransactionRequest.new(braspag_transaction_id, amount)
      Braspag::CaptureCreditCardTransactionRequestBuilder.new.with_request_id(request_id).with_transaction_request(transaction_request).build
    end

    def call_webservice(method, request)
      body = request.to_hash
      @connection.call_webservice(method, body)
    end
  end
end
