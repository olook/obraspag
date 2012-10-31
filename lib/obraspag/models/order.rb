module Braspag
  class Order
    include ::ActiveAttr::Model

    attribute :number
    attribute :merchant_id

    attr_accessor :number, :merchant_id

    validates :number, :presence => true

    def initialize(number)
      @number = number
      @merchant_id = "540BA6EE-39D7-3DC1-D87D-7F82C49A3598"
    end

    def to_hash
      {
        "MerchantId" => self.merchant_id,
        "OrderId" => self.number
      }
    end

  end
end
