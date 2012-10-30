module Braspag
    class Payment
        attr_accessor :customer_id, :payment_method, :amount, :currency, :country
        def to_hash(hash)
            payment_attrs = {
                "CustomerId"        => self.customer_id ,
                "PaymentMethod"     => self.payment_method,
                "Amount"            => self.amount,
                "Currency"          => self.currency,
                "Country"           => self.country,
                :attributes! => { "ins0:AdditionalDataCollection" => { "xsi:nil" => "true" } }
            }
            payment_attrs.merge(hash)
        end
    end
end
