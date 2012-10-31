require 'spec_helper'

describe Braspag::CreditCardBuilder do

    context "with valid build data" do
        subject { complete_builder }

        it "should build a CreditCard object" do
            subject.build.should_not be_nil
        end

    end

    context "with invalid build data" do
        subject { complete_builder }

        it "should raise exception when CreditCard is not valid" do
            subject.with_card_number(nil)
            expect { subject.build }.to raise_error
        end

    end

    def complete_builder
        builder = Braspag::CreditCardBuilder.new
        builder.with_payment_method(Braspag::PAYMENT_METHOD[:braspag])
        .with_amount("500").with_transaction_type("1").with_currency("BRL").with_country("BRA").with_number_of_payments(1)
        .with_payment_plan("0").with_transaction_type("1").with_holder_name("Comprador Teste").with_card_number("0000000000000001")
        .with_security_code("123").with_expiration_month("05").with_expiration_year("2018")
        builder
    end

end

