require 'spec_helper'

describe Braspag::AddressBuilder do

  context "with valid build data" do
    subject { complete_builder }

    it "should build an Address object" do
      subject.build.should_not be_nil
    end

  end

  def complete_builder
    builder = Braspag::AddressBuilder.new
    builder.with_street("Rua Teste")
    .with_number("123")
    .with_district("Bairro")
    .with_zip_code("00000-000")
    .with_city("Sao Paulo")
    .with_state("SP")
    .with_country("Brasil")
    builder
  end

end