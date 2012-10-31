module Braspag
  class CreditCardBuilder

    def initialize
      @credit_card = Braspag::CreditCard.new
    end

    def build
      raise 'CreditCard data is invalid.' unless @credit_card.valid?
      @credit_card
    end

    def with_payment_method(payment_method)
      @credit_card.payment_method = payment_method
      self
    end

    def with_amount(amount)
      @credit_card.amount = amount
      self
    end

    def with_currency(currency)
      @credit_card.currency = currency
      self
    end

    def with_country(country)
      @credit_card.country = country
      self
    end

    def with_holder_name(holder_name)
      @credit_card.holder_name = holder_name
      self
    end

    def with_card_number(card_number)
      @credit_card.card_number = card_number
      self
    end

    def with_expiration_month(expiration_month)
      @credit_card.expiration_month = expiration_month
      self
    end

    def with_expiration_year(expiration_year)
      @credit_card.expiration_year = expiration_year
      self
    end

    def with_security_code(security_code)
      @credit_card.security_code = security_code
      self
    end

    def with_number_of_payments(number_of_payments)
      @credit_card.number_of_payments = number_of_payments
      self
    end

    def with_payment_plan(payment_plan)
      @credit_card.payment_plan = payment_plan
      self
    end

    def with_transaction_type(transaction_type)
      @credit_card.transaction_type = transaction_type
      self
    end

  end
end