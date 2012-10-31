# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Braspag::Address do

  context "address validation" do

    subject { 

      a = Braspag::Address.new
      a.street = "R. Jacu"
      a.number = "123"
      a.complement = "ap. 23"
      a.district = "Itaim Paulista"
      a.zip_code = "03232-100"
      a.city = "São Paulo"
      a.state = "SP"
      a.country = "Brazil"

      a
     }

      it "should validate a valid order" do
        subject.valid?.should eq(true)
      end

  end

end
