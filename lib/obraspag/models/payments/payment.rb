module Braspag
    class Payment
        include ::ActiveAttr::Model
        
        attribute :payment_method
        attribute :amount
        attribute :currency
        attribute :country

        attr_accessor :payment_method, :amount, :currency, :country

        validates :payment_method, :presence => true
        validates :amount, :presence => true

        def to_hash(hash, payment_type)
            {
                "PaymentDataRequest" =>  {
                    "PaymentMethod"     => self.payment_method,
                    "Amount"            => self.amount,
                    "Currency"          => self.currency,
                    "Country"           => self.country,
                    :attributes! => { "ins0:AdditionalDataCollection" => { "xsi:nil" => "true" } }
                }.merge(hash),
                :attributes! => { "wsdl:PaymentDataRequest" => { "xsi:type" => payment_type } }
            }
        end
    end
end
