module Braspag
  class Customer
    include ::ActiveAttr::Model

    attribute :id
    attribute :name
    attribute :email
    attribute :customer_address
    attribute :delivery_address

    attr_accessor :id, :name, :email, :customer_address, :delivery_address

    validates :id, :presence => true
    validates :name, :presence => true
    validates :email, :presence => true
    
    def to_hash
      {
        "CustomerIdentity" => self.id.to_s,
        "CustomerName" => self.name,
        "CustomerEmail" => self.email,
        "CustomerAddressData" => self.customer_address.to_hash,
        "DeliveryAddressData" => self.delivery_address.to_hash
      }    
    end

  end
end

