require 'spec_helper'

describe Braspag::Connection do

  context "#wsdl_url" do
    it "should receive production url" do
        Braspag::Connection.new.wsdl_url.should eq("production_url")
    end

    it "should receive homolog url" do
        Braspag::Connection.new(:homolog).wsdl_url.should eq("https://homologacao.pagador.com.br/webservice/pagadorTransaction.asmx")
    end
  end

end
