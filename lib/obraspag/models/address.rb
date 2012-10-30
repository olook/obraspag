module Braspag
  class Address
    attribute :street
    attribute :number
    attribute :district
    attribute :zip_code
    attribute :city
    attribute :state
    attribute :country
    attribute :address_type

    attr_accessor :street, :number, :complement, :district, :zip_code, :city, :state, :country, :address_type

    def to_hash
      {
        "Street" => "Rua de Casa",
        "Number" => "123",
        "Complement" => "",
        "District" => "Pinheiros",
        "ZipCode" => "05425-070",
        "City" => "Sao Paulo",
        "State" => "SP",
        "Country" => "Brasil"
      }      
    end
  end
end