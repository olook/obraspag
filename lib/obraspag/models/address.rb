module Braspag
  class Address
    include ::ActiveAttr::Model

    attribute :street
    attribute :number
    attribute :complement
    attribute :district
    attribute :zip_code
    attribute :city
    attribute :state
    attribute :country

    attr_accessor :street, :number, :complement, :district, :zip_code, :city, :state, :country

    def to_hash
      {
        :street => self.street,
        :number => self.number,
        :complement => self.complement,
        :district => self.district,
        :zip_code => self.zip_code,
        :city => self.city,
        :state => self.state,
        :country => self.country
      }      
    end
  end
end