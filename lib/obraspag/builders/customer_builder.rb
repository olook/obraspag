module Braspag
  class CustomerBuilder

    def initialize
      @customer = Braspag::Customer.new
    end

    def build
      raise 'Customer data is invalid.' unless @customer.valid?
      @customer
    end

    def with_customer_id(customer_id)
      @customer.id = customer_id
      self
    end

    def with_customer_name(customer_name)
      @customer.name = customer_name
      self
    end

    def with_customer_email(customer_email)
      @customer.email = customer_email
      self
    end
  end
end