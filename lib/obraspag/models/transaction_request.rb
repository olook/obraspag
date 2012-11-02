module Braspag
  class TransactionRequest
    include ::ActiveAttr::Model

    attribute :braspag_transaction_id
    attribute :amount

    attr_accessor :braspag_transaction_id, :amount

    validates :braspag_transaction_id, :presence => true

    def initialize(braspag_transaction_id, amount=nil)
      @braspag_transaction_id = braspag_transaction_id
      @amount = amount
    end

    def to_hash
      transaction_hash = {
        "TransactionDataRequest"  =>  {
          "BraspagTransactionId"  => self.braspag_transaction_id,
        }
      }
      transaction_hash["TransactionDataRequest"].merge!({ "Amount" => self.amount}) unless self.amount.blank?
      transaction_hash
    end
  end
end
