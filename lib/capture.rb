require './lib/obraspag'

transaction_request = Braspag::TransactionRequest.new("540BA6EE-39D7-3DC1-D87D-7F82C49A3598", "500")

request = Braspag::CaptureCreditCardTransactionRequestBuilder.new.with_request_id("00000000-0000-0000-0000-000000000007")
.with_transaction_request(transaction_request).build

webservice = Braspag::Webservice.new(:homolog)
webservice.capture_credit_card_transaction(request)