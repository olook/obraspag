module Braspag
    class CreditCard
        require 'pry'
        binding.pry
        include ::ActiveAttr::Model
        attr_accessor :holder_name, :number, :month, :year, :verification_value, :id, :currency, :security_code, :number_of_payments

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


        [:purchase, :authorize, :archive].each do |check_on|
            validates :holder_name, :length => {:minimum => 1, :maximum => 100, :on => check_on}

            validates :number, :presence => { :on => check_on }

            validates :month, :presence => { :on => check_on }
            validates :month, :expirator => { :on => check_on }
            validates :year, :presence => { :on => check_on }
            validates :year, :expirator => { :on => check_on }
            validates :verification_value, :length => {:minimum => 1, :maximum => 4, :on => check_on }
        end

    end
end
