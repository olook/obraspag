module Braspag
  class Customer
    include ::ActiveAttr::Model

    attribute :id
    attribute :name
    attribute :email
    attribute :customer_address
    attribute :delivery_address

    validates :id, :presence => true
    validates :name, :presence => true
    validates :email, :presence => true
    validates :customer_address, :presence => true
    validates :delivery_address, :presence => true
    
    def to_hash
      {
        "CustomerIdentity" => self.id.to_s,
        "CustomerName" => self.name,
        "CustomerEmail" => self.email,
        "CustomerAddressData" => {
          "Street" => "Rua de Casa",
          "Number" => "123",
          "Complement" => "",
          "District" => "Pinheiros",
          "ZipCode" => "05425-070",
          "City" => "Sao Paulo",
          "State" => "SP",
          "Country" => "Brasil"
        },
        "DeliveryAddressData" => {
          "Street" => "Rua de Casa",
          "Number" => "123",
          "Complement" => "",
          "District" => "Pinheiros",
          "ZipCode" => "05425-070",
          "City" => "Sao Paulo",
          "State" => "SP",
          "Country" => "Brasil"
        }
      }      
    end

  end
end

