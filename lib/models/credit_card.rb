module Braspag
    class CreditCard
        attr_accessor :holder_name, :number, :month, :year, :verification_value, :id, :currency, :security_code, :number_of_payments
        def validate_date
            begin
                year = self.year.try(:to_i)
                year = "20#{year}".to_i if year && year.to_s.size == 2
                month = record.month.try(:to_i)
                Date.new(year, month) if year && month
            rescue ArgumentError
                self.errors.add attribute, "invalid date"
            end
        end

    end
end
