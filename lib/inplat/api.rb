module Inplat
  class Api
    POST_METHODS = ["form", "init"].freeze

    def initialize(configuration, client)
      @configuration = configuration
      @client = client
    end

    POST_METHODS.each do |method_name|
      define_method(method_name) do |params|
        params = params.merge(method: method_name)
        request_body = params.to_json
        sign = OpenSSL::HMAC.hexdigest('SHA256', configuration.secret, request_body)

        uri = "#{configuration.host}/?api_key=#{configuration.api_key}&sign=#{sign}"
        client.post(uri, request_body, {content_type: "application/json"})
      end
    end

    private

    attr_reader :configuration, :client
  end
end
