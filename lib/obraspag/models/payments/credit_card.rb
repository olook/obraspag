module Braspag
    class CreditCard < Payment
        include ::ActiveAttr::Model

        attribute :holder_name
        attribute :card_number
        attribute :expiration_month
        attribute :expiration_year
        attribute :security_code
        attribute :number_of_payments
        attribute :payment_plan
        attribute :transaction_type

        attr_accessor :holder_name, :card_number, :expiration_month, :expiration_year, :security_code, :number_of_payments, :payment_plan, :transaction_type

        class ExpiratorValidator < ActiveModel::EachValidator
            def validate_each(record, attribute, value)
                begin
                    year = record.expiration_year.try(:to_i)
                    year = "20#{year}".to_i if year && year.to_s.size == 2

                    month = record.expiration_month.try(:to_i)

                    Date.new(year, month) if year && month
                rescue ArgumentError
                    record.errors.add attribute, "invalid date"
                end
            end
        end

        validates :holder_name, :length => {:minimum => 1, :maximum => 100, :on => :to_hash}
        validates :card_number, :presence => { :on => :to_hash }
        validates :security_code, :presence => { :on => :to_hash }
        validates :number_of_payments, :presence => { :on => :to_hash }
        validates :payment_plan, :presence => { :on => :to_hash }
        validates :expiration_month, :presence => { :on => :to_hash }
        validates :expiration_month, :expirator => { :on => :to_hash }
        validates :expiration_year, :presence => { :on => :to_hash }
        validates :expiration_year, :expirator => { :on => :to_hash }
        validates :security_code, :length => {:minimum => 1, :maximum => 4, :on => :to_hash }

        def to_hash
            super({
                "NumberOfPayments"   => self.number_of_payments.to_s,
                "PaymentPlan"        => self.payment_plan.to_s,
                "TransactionType"    => self.transaction_type.to_s,
                "CardHolder"         => self.holder_name.to_s,
                "CardNumber"         => self.card_number.to_s,
                "CardSecurityCode"   => self.security_code.to_s,
                "CardExpirationDate" => "#{ self.expiration_month.to_s }/#{ self.expiration_year.to_s }"
            },"ins0:CreditCardDataRequest")
        end

    end
end
