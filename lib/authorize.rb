require 'savon'

client = Savon::Client.new "https://homologacao.pagador.com.br/webservice/pagadorTransaction.asmx?WSDL"

authorize_body = 
	{
		"request" => {
			"RequestId" => "00000000-0000-0000-0000-000000000006",
	        "Version" =>"1.0",
			"OrderData" => {
				"MerchantId" => "540BA6EE-39D7-3DC1-D87D-7F82C49A3598",
				"OrderId" => "0005"
			},
			"CustomerData" => {
				"CustomerIdentity" => "1234",
          		"CustomerName" => "Matheus",
          		"CustomerEmail" => "matheus.bodo@olook.com.br",
          		"CustomerAddressData" => {
          			"Street" => "Rua de Casa",
            		"Number" => "123",
            		"Complement" => "",
            		"District" => "Pinheiros",
            		"ZipCode" => "05425-070",
            		"City" => "Sao Paulo",
            		"State" => "SP",
            		"Country" => "Brasil"
          		},
          		"DeliveryAddressData" => {
          			"Street" => "Rua de Casa",
            		"Number" => "123",
            		"Complement" => "",
            		"District" => "Pinheiros",
            		"ZipCode" => "05425-070",
            		"City" => "Sao Paulo",
            		"State" => "SP",
            		"Country" => "Brasil"
          		}
			},
			"PaymentDataCollection" => {
				"PaymentDataRequest" => { 
					"PaymentMethod" => "997",
					"Amount" => "500",
	            	"TransactionType" => "1",
	            	"Currency" => "BRL",
	            	"Country" => "BRA",
	            	"NumberOfPayments" => "1",
	            	"PaymentPlan" => "0",
	            	"TransactionType" => "1",
	            	"CardHolder" => "Comprador Teste",
	            	"CardNumber" => "0000000000000001",
	            	"CardSecurityCode" => "123",
	            	"CardExpirationDate" => "05/2018",
	            	"AdditionalDataCollection" => "",
	            	:attributes! => { "ins0:AdditionalDataCollection" => { "xsi:nil" => "true" }  }
            	},
            	:attributes! => { 
            		"ins0:PaymentDataRequest" => { "xsi:type" => "ins0:CreditCardDataRequest" }
            	}
			}
		}
	}

response = client.request :authorize_transaction do
	soap.body = authorize_body
end

puts response.to_hash