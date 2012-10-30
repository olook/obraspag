module Braspag
  class Order
    include ::ActiveAttr::Model

    attr_accessor :order_number, :payment_method, :customer

    validates :order_number, :presence => true
    validates :payment_method, :presence => true
    validates :customer, :presence => true
  end
end
