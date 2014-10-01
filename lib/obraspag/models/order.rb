module Braspag

  class Order
    include ::ActiveAttr::Model

    attribute :number
    attribute :merchant_id

    attr_accessor :number, :merchant_id

    validates :number, :presence => true
    validates :merchant_id, :presence => true

    def initialize(number, env='test')
      @env = env
      @number = number
      @merchant_id = self.merchant_id
    end

    def to_hash
      {
        "MerchantId" => self.merchant_id,
        "OrderId" => self.number
      }
    end

    def merchant_id
      config_file = YAML.load_file(Braspag.config_file_path)
      if config_file.include?(@env)
        options = config_file[@env]
        options['merchant_id']
      else
        config_file['development']['merchant_id']
      end
    end
  end
end
