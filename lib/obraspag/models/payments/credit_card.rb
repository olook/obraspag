module Braspag

  class CreditCard
    attr_accessor :holder_name, :number, :month, :year, :security_code, :number_of_payments, :payment_plan, :transaction_type
    include ::ActiveAttr::Model

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

        validates :holder_name, :length => {:minimum => 1, :maximum => 100}
        validates :number
        validates :security_code, { :presence => true }
        validates :number_of_payments, { :presence => true }
        validates :payment_plan, { :presence => true }
        validates :month, { :presence => true }
        validates :month, :expirator
        validates :year, { :presence => true }
        validates :year, :expirator
        validates :security_code, :length => {:minimum => 1, :maximum => 4,  :presence => true }
  end
end
