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
      Gyoku.xml({
        :customer_identity => self.id.to_s,
        :customer_name => self.name,
        :customer_email => self.email,
        :customer_address_data => self.customer_address.to_hash,
        :delivery_address_data => self.delivery_address.to_hash
      }, { :key_converter => :camelcase })    
    end

  end
end

