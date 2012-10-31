require 'savon'
require './lib/obraspag'

# client = Savon::Client.new "https://homologacao.pagador.com.br/webservice/pagadorTransaction.asmx?WSDL"
# 
# authorize_body = 
#   {
#     "request" => {
#       "RequestId" => "00000000-0000-0000-0000-000000000007",
#           "Version" =>"1.0",
#       "OrderData" => {
#         "MerchantId" => "540BA6EE-39D7-3DC1-D87D-7F82C49A3598",
#         "OrderId" => "0006"
#       },
#       "CustomerData" => {
#         "CustomerIdentity" => "1234",
#         "CustomerName" => "Matheus",
#         "CustomerEmail" => "matheus.bodo@olook.com.br",
#         "CustomerAddressData" => {
#           "Street" => "Rua de Casa",
#           "Number" => "123",
#           "Complement" => "",
#           "District" => "Pinheiros",
#           "ZipCode" => "05425-070",
#           "City" => "Sao Paulo",
#           "State" => "SP",
#           "Country" => "Brasil"
#         },
#         "DeliveryAddressData" => {
#           "Street" => "Rua de Casa",
#           "Number" => "123",
#           "Complement" => "",
#           "District" => "Pinheiros",
#           "ZipCode" => "05425-070",
#           "City" => "Sao Paulo",
#           "State" => "SP",
#           "Country" => "Brasil"
#         }
#       },
#       "PaymentDataCollection" => {
#         "PaymentDataRequest" => { 
#           "PaymentMethod" => "997",
#           "Amount" => "500",
#           "TransactionType" => "1",
#           "Currency" => "BRL",
#           "Country" => "BRA",
#           "NumberOfPayments" => "1",
#           "PaymentPlan" => "0",
#           "TransactionType" => "1",
#           "CardHolder" => "Comprador Teste",
#           "CardNumber" => "0000000000000001",
#           "CardSecurityCode" => "123",
#           "CardExpirationDate" => "05/2018",
#           "AdditionalDataCollection" => "",
#           :attributes! => { "ins0:AdditionalDataCollection" => { "xsi:nil" => "true" }  }
#         },
#         :attributes! => { 
#           "ins0:PaymentDataRequest" => { "xsi:type" => "ins0:CreditCardDataRequest" }
#         }
#       }
#     }
#   }

order = Braspag::Order.new(0006)

address = Braspag::AddressBuilder.new.with_street("Rua de Casa").with_number("123").with_complement("").with_district("Pinheiros")
.with_zip_code("05425-070").with_city("Sao Paulo").with_state("SP").with_country("Brasil").build

customer = Braspag::CustomerBuilder.new.with_customer_id("1234").with_customer_name("Matheus").with_customer_email("matheus.bodo@olook.com.br")
.with_customer_address(address).with_delivery_address(address).build

request = Braspag::AuthorizeTransactionRequestBuilder.new.with_request_id("00000000-0000-0000-0000-000000000007")
.for_order(order).for_customer(customer).build

authorize_body = request.to_hash

puts authorize_body