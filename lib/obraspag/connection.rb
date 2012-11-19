module Braspag
  class Connection
    HOMOLOG_URL = "https://homologacao.pagador.com.br/webservice/pagadorTransaction.asmx?WSDL"
    PRODUCTION_URL = "production_url"

    def initialize(env = :production)
      @env = env
    end

    def call_webservice(method, body)
      client = ::Savon::Client.new :wsdl, wsdl_url
      client.http.read_timeout = 10000
      response = client.request method do
        soap.body = body
      end
      response.to_hash
    end

    def wsdl_url
      production? ? PRODUCTION_URL : HOMOLOG_URL
    end

    def production?
      @env == :production
    end
  end
end
