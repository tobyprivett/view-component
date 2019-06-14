module WordPress
  module V2
    class Base
      API_ENDPOINT = 'https://demo.wp-api.org'.freeze

      def initialize
      end

      protected

      def client
        @_client ||= Faraday.new(API_ENDPOINT) do |client|
          client.request :url_encoded
          client.adapter Faraday.default_adapter
        end
      end

      def request(http_method:, endpoint:, params: {})
        response = client.public_send(http_method, endpoint, params)
        JSON.parse(response.body, symbolize_names: true)
      end
    end
  end
end
