module Braspag
    class Payment
        attr_accessor :customer_id, :payment_method, :amount, :currency, :country
        def to_hash(hash, payment_type)
            {
                "PaymentDataRequest" =>  {
                    "CustomerId"        => self.customer_id ,
                    "PaymentMethod"     => self.payment_method,
                    "Amount"            => self.amount,
                    "Currency"          => self.currency,
                    "Country"           => self.country,
                    :attributes! => { "ins0:AdditionalDataCollection" => { "xsi:nil" => "true" } }
                }.merge(hash),
                :attributes! => { "ins0:PaymentDataRequest" => { "xsi:type" => payment_type } }
            }
        end
    end
end
