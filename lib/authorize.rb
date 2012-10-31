require './lib/obraspag'

order = Braspag::Order.new(0006)

address = Braspag::AddressBuilder.new.with_street("Rua de Casa").with_number("123").with_complement("").with_district("Pinheiros")
.with_zip_code("05425-070").with_city("Sao Paulo").with_state("SP").with_country("Brasil").build

customer = Braspag::CustomerBuilder.new.with_customer_id("1234").with_customer_name("Matheus").with_customer_email("matheus.bodo@olook.com.br")
.with_customer_address(address).with_delivery_address(address).build

payment_request = Braspag::CreditCardBuilder.new.with_payment_method(Braspag::PAYMENT_METHOD[:braspag])
.with_amount("500").with_transaction_type("1").with_currency("BRL").with_country("BRA").with_number_of_payments(1)
.with_payment_plan("0").with_transaction_type("1").with_holder_name("Comprador Teste").with_card_number("0000000000000001")
.with_security_code("123").with_expiration_month("05").with_expiration_year("2018").build

request = Braspag::AuthorizeTransactionRequestBuilder.new.with_request_id("00000000-0000-0000-0000-000000000007")
.for_order(order).for_customer(customer).with_payment_request(payment_request).build

webservice = Braspag::Webservice.new(:homolog)
webservice.authorize_transaction(request)