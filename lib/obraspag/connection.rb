module Braspag
    class Connection
        HOMOLOG_URL = "https://homologacao.pagador.com.br/webservice/pagadorTransaction.asmx"
        PRODUCTION_URL = "production_url"
        def initialize(env = :production)
            @env = env
        end

        def call_webservice(body)
        end

        def url_for
            production? ? PRODUCTION_URL : HOMOLOG_URL
        end

        def production?
            @env == :production
        end
    end
end
