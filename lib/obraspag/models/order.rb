module Braspag

    def self.merchant_id
      options = YAML.load_file(Braspag.config_file_path)[ ENV['RAILS_ENV']]
      options['merchant_id']
    end

  class Order
    include ::ActiveAttr::Model

    attribute :number
    attribute :merchant_id

    attr_accessor :number, :merchant_id

    validates :number, :presence => true
    validates :merchant_id, :presence => true

    def initialize(number)
      @number = number
      @merchant_id = Braspag.merchant_id
    end

    def to_hash
      {
        "MerchantId" => self.merchant_id,
        "OrderId" => self.number
      }
    end

  end
end
