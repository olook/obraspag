module Braspag
  class CaptureCreditCardTransactionRequest

    include ::ActiveAttr::Model

    attribute :request_id
    attribute :version
    attribute :merchant_id
    attribute :transaction_data_collection

    attr_accessor :request_id, :version, :merchant_id, :transaction_data_collection

    validates :request_id, :version, :merchant_id , {:presence => true}

    def initialize
    	@version = CONTRACT_VERSION
    	@merchant_id = MERCHANT_ID
    	@transaction_data_collection = []
    end

    def to_hash
        {
          "request" => {
            "RequestId" => self.request_id,
            "Version" =>self.version,
            "MerchantId" => self.merchant_id,
            "TransactionDataCollection" =>  self.transaction_data_collection
          }
        }
      end

  end
end