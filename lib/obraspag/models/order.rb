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
      @merchant_id = MERCHANT_ID
    end

    def to_hash
      {
        "MerchantId" => self.merchant_id,
        "OrderId" => self.number
      }
    end

  end
end
