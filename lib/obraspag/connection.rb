module Braspag
  class Connection
    HOMOLOG_URL = "https://homologacao.pagador.com.br/webservice/pagadorTransaction.asmx?WSDL"
    PRODUCTION_URL = "https://transaction.pagador.com.br/webservice/pagadorTransaction.asmx?WSDL"

    def initialize(env = :production)
      @env = env
    end

    def call_webservice(method, body)
      logger().info("Calling method #{method.try(:to_s)} with body: #{remove_sensitive_data(body.dup)}")
      client = ::Savon::Client.new wsdl_url
      client.http.read_timeout = 10000
      response = client.request :wsdl, method do
        soap.body = body
      end
      logger().info("Response: #{response.try(:to_hash)}")
      response.to_hash
    end

    def wsdl_url
      production? ? PRODUCTION_URL : HOMOLOG_URL
    end

    def production?
      @env == :production
    end

    def remove_sensitive_data(params)
      case params.class.to_s
        when "Hash"
          Hash[params.map { |k,v| 
            if k == :card_number
              v = "XXXXXXXXXXXXXXXX"
            elsif k == :security_code
              v = "XXX"
            end
            [k, remove_sensitive_data(v)] } ]
        when "Array"
          params.map { |v| remove_sensitive_data(v) }
        else
          params
      end
    end

    def logger
      @@logger ||= Logger.new("#{Rails.root}/log/obraspag.log")
    end
  end
end
