module Braspag
  class Order
    include ::ActiveAttr::Model

    attr_accessor :order_number, :payment_method, :customer

    validates_presence_of :order_number
  end
end
