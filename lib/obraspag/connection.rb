module Braspag
  class Connection
    HOMOLOG_URL = "https://homologacao.pagador.com.br/webservice/pagadorTransaction.asmx?WSDL"
    PRODUCTION_URL = "https://transaction.pagador.com.br/webservice/pagadorTransaction.asmx?WSDL"

    def initialize(env = :production)
      @env = env
    end

    def call_webservice(method, body)

      logger().info("Calling method #{method.try(:to_s)} with body: #{remove_sensitive_data(body.dup)}")
      client = ::Savon.client(wsdl: wsdl_url, endpoint: wsdl_url, read_timeout: 600,pretty_print_xml: true, 
        log: true, 
        log_level: :debug, env_namespace: :soap)

      # client = ::Savon::Client.new wsdl_url
      # client.http.read_timeout = 600
      response = client.call(method, message: Gyoku.xml(body.to_hash,{ :key_converter => :camelcase }), :attributes => { 'xmlns' => 'https://www.pagador.com.br/webservice/pagador' })

      # response = client.request :wsdl, method do
      #   soap.body = body
      # end
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
            elsif k == :card_security_code
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
