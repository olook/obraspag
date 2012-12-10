module Braspag
  class Connection
    HOMOLOG_URL = "https://homologacao.pagador.com.br/webservice/pagadorTransaction.asmx?WSDL"
    PRODUCTION_URL = "https://transaction.pagador.com.br/webservice/pagadorTransaction.asmx?WSDL"

    def initialize(env = :production)
      @env = env
    end

    def call_webservice(method, body)
      logger.info("Calling method #{method.try(:to_s)} with body: #{body.try(:to_s)}")
      client = ::Savon::Client.new wsdl_url
      client.http.read_timeout = 10000
      response = client.request :wsdl, method do
        soap.body = body
      end
      logger.info("Response: #{response.try(:to_hash)}")
      response.to_hash
    end

    def wsdl_url
      production? ? PRODUCTION_URL : HOMOLOG_URL
    end

    def production?
      @env == :production
    end

    def def logger
      @@logger ||= Logger.new("#{Rails.root}/log/obraspag.log")
    end
  end
end
