require 'faraday'
require 'json'

class Connection
    BASE = "https://api.themoviedb.org"

    def self.api
        Faraday.new(url: BASE) do |faraday|

            # Form-encode POST params
            faraday.request :url_encoded

            # filter api_key from the logs
            faraday.response :logger do |logger|
                logger.filter(/(api_key=)(\w+)/,'\1[REMOVED]')
            end

            # use Net::HTTP adapter
            faraday.adapter Faraday.default_adapter
        end
    end
end