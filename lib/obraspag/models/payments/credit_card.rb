module Braspag
    class CreditCard < Payment
        include ::ActiveAttr::Model
        attr_accessor :holder_name, :number, :month, :year, :security_code, :number_of_payments, :payment_plan, :transaction_type

        class ExpiratorValidator < ActiveModel::EachValidator
            def validate_each(record, attribute, value)
                begin
                    year = record.year.try(:to_i)
                    year = "20#{year}".to_i if year && year.to_s.size == 2

                    month = record.month.try(:to_i)

                    Date.new(year, month) if year && month
                rescue ArgumentError
                    record.errors.add attribute, "invalid date"
                end
            end
        end

        validates :holder_name, :length => {:minimum => 1, :maximum => 100, :on => :to_hash}
        validates :number, :presence => { :on => :to_hash }
        validates :security_code, :presence => { :on => :to_hash }
        validates :number_of_payments, :presence => { :on => :to_hash }
        validates :payment_plan, :presence => { :on => :to_hash }
        validates :month, :presence => { :on => :to_hash }
        validates :month, :expirator => { :on => :to_hash }
        validates :year, :presence => { :on => :to_hash }
        validates :year, :expirator => { :on => :to_hash }
        validates :security_code, :length => {:minimum => 1, :maximum => 4, :on => :to_hash }

        def to_hash
            super({
                "NumberOfPayments"   => self.number_of_payments.to_s,
                "PaymentPlan"        => self.payment_plan.to_s,
                "Number"             => self.number.to_s,
                "TransactionType"    => self.transaction_type.to_s,
                "CardHolder"         => self.holder_name.to_s,
                "CardNumber"         => self.number.to_s,
                "CardSecurityCode"   => self.security_code.to_s,
                "CardExpirationDate" => "#{ self.month.to_s }/#{ self.year.to_s }"
            },"ins0:CreditCardDataRequest")
        end

    end
end

module Braspag
    class Billet < Payment
        def to_hash
            puts "hash for billet"
        end
    end
end
