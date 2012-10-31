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
        "Street" => self.street,
        "Number" => self.number,
        "Complement" => self.complement,
        "District" => self.district,
        "ZipCode" => self.zip_code,
        "City" => self.city,
        "State" => self.state,
        "Country" => self.country
      }      
    end
  end
end