module Braspag
  class Customer
    include ::ActiveAttr::Model

    attr_accessor :id, :name, :email

    validates :id, :presence => true
    validates :name, :presence => true
    validates :email, :presence => true
    
  end
end

