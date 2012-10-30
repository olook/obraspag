module Braspag
  class AddressBuilder

    def initialize
      @address = Braspag::Address.new
    end

    def build
      raise 'Address data is invalid.' unless @address.valid?
      @address
    end

    def with_street(street)
      @address.street = street
      self
    end

    def with_number(number)
      @address.number = number
      self
    end

    def with_complement(complement)
      @address.complement = complement
      self
    end

    def with_district(district)
      @address.district = district
      self
    end

    def with_zip_code(zip_code)
      @address.zip_code = zip_code
      self
    end

    def with_city(city)
      @address.city = city
      self
    end

    def with_state(state)
      @address.state = state
      self
    end

    def with_country(country)
      @address.country = country
      self
    end

  end
end