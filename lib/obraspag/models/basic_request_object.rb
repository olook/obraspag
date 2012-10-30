module Braspag
    class BasicObject

        attr_accessor :request_id, :version, :merchant_id, :transaction_data_collection

        def initialize
          @transaction_data_collection = []
        end
    end
end
