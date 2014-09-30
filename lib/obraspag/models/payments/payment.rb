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
            Gyoku.xml({
                :payment_data_request =>  {
                    :payment_method     => self.payment_method,
                    :amount            => self.amount,
                    :currency          => self.currency,
                    :country           => self.country,
                    :attributes! => { :additional_data_collection => { "xsi:nil" => "true" } }
                }.merge(hash),
                :attributes! => { :payment_data_request => { "xsi:type" => payment_type } }
            }, { :key_converter => :camelcase })
        end
    end
end
