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
        if authorize_response[:authorize_transaction_response][:authorize_transaction_result][:success]
            capture_response = capture_credit_card_transaction(authorize_response)
            [authorize_response, capture_response]
        else
            authorize_response
        end
    end

  	private

  	def call_webservice(method, request)
  		body = request.to_hash
  		@connection.call_webservice(method, body)
  	end
  end
end
