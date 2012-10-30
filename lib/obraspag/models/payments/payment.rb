module Braspag
  class Payment
    attr_accessor :holder_name, :customer_id, :payment_method, :amount, :currency, :country
  end
end
