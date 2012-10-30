module Braspag
  class Customer
    include ::ActiveAttr::Model

    attr_accessor :id, :name, :email

    validates :id, :presence => true
    validates :name, :presence => true
    validates :email, :presence => true
    
    def to_hash
      {
        "CustomerIdentity" => "1234",
        "CustomerName" => "Matheus",
        "CustomerEmail" => "matheus.bodo@olook.com.br",
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

