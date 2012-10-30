module Braspag
  class Order
    include ::ActiveAttr::Model

    attribute :order_number
    attribute :payment_method
    attribute :customer
    attribute :merchant_id

    attr_accessor :number, :payment_method, :customer, :merchant_id

    validates :number, :presence => true
    validates :payment_method, :presence => true
    validates :customer, :presence => true

    def initialize
      @customer = Customer.new
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
