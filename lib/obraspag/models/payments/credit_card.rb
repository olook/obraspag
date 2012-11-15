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

        validates :holder_name, :card_number, :security_code, :number_of_payments, :payment_plan, :expiration_month, :expiration_year, { :presence => true }

        validates :holder_name, :length => {:minimum => 1, :maximum => 100 }
        validates :expiration_month, :expirator => { :on => :valid? }
        validates :expiration_year, :expirator => { :on => :valid? }
        validates :security_code, :length => {:minimum => 1, :maximum => 4 }

        def to_hash
            super({
                "NumberOfPayments"   => self.number_of_payments.to_s,
                "PaymentPlan"        => self.payment_plan.to_s,
                "TransactionType"    => self.transaction_type.to_s,
                "CardHolder"         => self.holder_name.to_s,
                "CardNumber"         => self.card_number.to_s,
                "CardSecurityCode"   => self.security_code.to_s,
                "CardExpirationDate" => "#{ self.expiration_month.to_s }/#{ self.expiration_year.to_s }"
            },"wsdl:CreditCardDataRequest")
        end

    end
end
