module Braspag

  class Order
    include ::ActiveAttr::Model

    attribute :number
    attribute :merchant_id

    attr_accessor :number, :merchant_id

    validates :number, :presence => true
    validates :merchant_id, :presence => true

    def initialize(number)
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
