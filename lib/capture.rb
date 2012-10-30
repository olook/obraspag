require 'savon'

client = Savon::Client.new "https://homologacao.pagador.com.br/webservice/pagadorTransaction.asmx?WSDL"

capture_body = authorize_body = 
	{
		"request" => {
			"RequestId" => "00000000-0000-0000-0000-000000000007",
	        "Version" =>"1.0",
	        "MerchantId" => "540BA6EE-39D7-3DC1-D87D-7F82C49A3598",
	        "TransactionDataCollection" => {
	        	"TransactionDataRequest" => {
	        		"BraspagTransactionId" => "170257b7-75f3-489e-933a-461ca2e44062",
	        		"Amount" => "500"
	        	}
	        }
	    }
    }

response = client.request :capture_credit_card_transaction do
	soap.body = authorize_body
end

puts response.to_hash