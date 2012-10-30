class RefundCreditCardTransactionRequest

  include ::ActiveAttr::Model

  attribute :request_id
  attribute :version
  attribute :merchant_id
  attribute :transaction_data_collection
  attr_accessor :request_id, :version, :merchant_id, :transaction_data_collection

  validates :request_id, :version, :merchant_id, :transaction_data_collection , {:presence => true}

end
