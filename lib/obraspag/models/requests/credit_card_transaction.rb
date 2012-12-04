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
          :request_id => self.request_id,
          :version => self.version,
          :merchant_id => self.merchant_id,
          :transaction_data_collection => self.transaction_data_collection
        }
      }
    end

    def merchant_id
      config_file = YAML.load_file(Braspag.config_file_path)
      if config_file.include?(Rails.env)
        options = config_file[Rails.env]
        options['merchant_id']
      else
        config_file['development']['merchant_id']
      end
    end
    
  end
end
