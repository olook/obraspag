module Braspag
    class Connection
        def call_webservice(body)

        end

        def url_for
            Rails.env.production? ? "production_url" : "homolog_url"
        end
    end
end
