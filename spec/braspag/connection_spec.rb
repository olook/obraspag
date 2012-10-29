require 'spec_helper'

describe Braspag::Connection do
    context "#url_for" do
        it "should receive production url" do
            Braspag::Connection.new.url_for.should eq("production_url")
        end

        it "should receive homolog url" do
            Braspag::Connection.new(:homolog).url_for.should eq("https://homologacao.pagador.com.br/webservice/pagadorTransaction.asmx")
        end
    end
end
