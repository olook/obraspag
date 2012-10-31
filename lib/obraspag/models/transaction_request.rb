module Braspag
  class TransactionRequest
    include ::ActiveAttr::Model

    attribute :braspag_transaction_id
    attribute :amount

    attr_accessor :braspag_transaction_id, :amount

    validates :braspag_transaction_id, :presence => true
    validates :amount, :presence => true

    def initialize(braspag_transaction_id, amount)
      @braspag_transaction_id = braspag_transaction_id
      @amount = amount
    end

    def to_hash
      {
        "TransactionDataRequest"  =>  {
          "BraspagTransactionId"  => self.braspag_transaction_id,
          "Amount"                => self.amount,
        }
      }
    end
  end
end