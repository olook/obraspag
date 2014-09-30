module Braspag

  class AuthorizeTransactionRequest
    include ::ActiveAttr::Model

    attribute :request_id
    attribute :version
    attribute :order_data
    attribute :payment_data_collection
    attribute :customer_data

    attr_accessor :request_id, :version, :order_data, :payment_data_collection, :customer_data

    validates :request_id, {:presence => true, :length => {is: 36}}
    validate :request_id_format?

    def initialize
      @version = CONTRACT_VERSION
      @payment_data_collection = []
    end

    def to_hash
      Gyoku.xml({
        "request" => {
          :request_id => self.request_id,
          :version =>self.version,
          :order_data => self.order_data.to_hash,
          :customer_data => self.customer_data.to_hash,
          :payment_data_collection =>  self.payment_data_collection
        }
      }, { :key_converter => :camelcase })
    end

    def request_id_format?
      errors.add(:request_id_format , "O request id nao se encontra no formato {00000000-0000-0000-0000-000000000000}") if request_id && request_id.match(/\h{8}-\h{4}-\h{4}-\h{4}-\h{12}/).nil?
      request_id.match(/\h{8}-\h{4}-\h{4}-\h{4}-\h{12}/) ? true : false unless request_id.nil?
    end
  end
end
