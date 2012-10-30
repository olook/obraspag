module Braspag
  class CreditCard
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


    validates :holder_name, :length => {:minimum => 1, :maximum => 100, :on => :authorize}
    validates :number, :presence => { :on => :authorize }
    validates :security_code, :presence => { :on => :authorize }
    validates :number_of_payments, :presence => { :on => :authorize }
    validates :payment_plan, :presence => { :on => :authorize }
    validates :month, :presence => { :on => :authorize }
    validates :month, :expirator => { :on => :authorize }
    validates :year, :presence => { :on => :authorize }
    validates :year, :expirator => { :on => :authorize }
    validates :security_code, :length => {:minimum => 1, :maximum => 4, :on => :authorize }

  end
end
