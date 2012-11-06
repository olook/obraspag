module Braspag

  class CreditCardTransactionRequest

    include ::ActiveAttr::Model

    attribute :request_id
    attribute :version
    attribute :merchant_id
    attribute :transaction_data_collection

    attr_accessor :request_id, :version, :merchant_id, :transaction_data_collection

    validates :request_id, :version, :merchant_id, {:presence => true}

    def initialize
      @merchant_id = self.merchant_id
      @version = CONTRACT_VERSION
      @transaction_data_collection = []
    end

    def to_hash
      {
        "request" => {
          "RequestId" => self.request_id,
          "Version" => self.version,
          "MerchantId" => self.merchant_id,
          "TransactionDataCollection" => self.transaction_data_collection
        }
      }
    end

    def merchant_id
      if YAML.load_file(Braspag.config_file_path).include?(:braspag)
        options = YAML.load_file(Braspag.config_file_path)[Rails.env]
        options['merchant_id']
      else
        options = YAML.load_file(Braspag.config_file_path)
        options['development']['merchant_id']
      end
    end
  end
end
