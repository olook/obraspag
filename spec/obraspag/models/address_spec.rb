# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Braspag::Address do

  context "to_hash tests" do
    let(:expected_hash) { 
      { :street => "R. Jacu", 
        :number =>"123", 
        :complement => "ap. 23", 
        :district =>"Itaim Paulista", 
        :zip_code =>"03232-100", 
        :city =>"São Paulo", 
        :state =>"SP", 
        :country =>"Brazil"} }
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

    it "should compare a generated hash to the expected hash" do
      subject.to_hash.should eq(expected_hash)
    end

  end

end
