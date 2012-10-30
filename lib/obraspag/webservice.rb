module Braspag
    class Webservice

    	def initialize(env)
    		@connection = Braspag::Connection.new(env)
    	end

    	def authorize(authorize_transaction_request)
    	end

    	def capture(capture_transaction_request)
    	end

    	def void(void_transaction_request)
    	end

    	def refund(refund_transaction_request)
    	end
    end
end