module Braspag
  class OrderBuilder

    def initialize
      @order = Braspag::Order.new
    end

    def build
      raise 'Order data is invalid.' unless @order.valid?
      raise 'Customer data is invalid.' unless @order.customer.valid?
      @order
    end

     def with_order_number(order_number)
      @order.order_number = order_number
      self
    end

    def with_payment_method(payment_method)
      @order.payment_method = payment_method
      self
    end

    def for_customer(customer)
      @order.customer = customer
      self
    end
  end
end