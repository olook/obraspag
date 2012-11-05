module Braspag

  class VoidCreditCardTransactionRequest

    include ::ActiveAttr::Model

    attribute :request_id
    attribute :version
    attribute :merchant_id
    attribute :transaction_data_collection
    attr_accessor :request_id, :version, :merchant_id, :transaction_data_collection

    validates :request_id, :version, :merchant_id, {:presence => true}

    def initialize
      @merchant_id = MERCHANT_ID
      @version = CONTRACT_VERSION
      @transaction_data_collection = []
    end

    def to_hash
      {
        "request" => {
            "RequestId" => self.request_id,
            "Version" => self.version,
            "MerchantId" => self.merchant_id,
            "TransactionDataRequest" => self.transaction_data_collection
        }
      }
    end

  end
end
