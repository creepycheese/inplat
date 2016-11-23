module Inplat
  class SignedRequest
    attr_reader :host, :secret, :api_key

    def initialize(params)
      @host = params.fetch(:host)
      @request_params = params.fetch(:request_params)
      @secret = params.fetch(:secret)
      @api_key = params.fetch(:api_key)
    end

    def request_body
      @request_body ||= @request_params.to_json
    end

    def signed_uri
      @uri ||= "#{host}/?api_key=#{api_key}&sign=#{sign}"
    end

    private

    def sign
      @sign = OpenSSL::HMAC.hexdigest('SHA256', secret, request_body)
    end
  end

  class Api
    POST_METHODS = ["form",
                    "init",
                    "check",
                    "pay",
                    "refund",
                    "link",
                    "links",
                    "unlink",
                    "reverse"
                    ].freeze

    def initialize(configuration, client)
      @configuration = configuration
      @client = client
    end

    POST_METHODS.each do |method_name|
      define_method(method_name) do |params|
        params = params.merge(method: method_name)
        signed_request = SignedRequest.new(host: configuration.host, request_params: params,
                                           secret: configuration.secret, api_key: configuration.api_key)

        JSON.parse(client.post(signed_request.signed_uri, signed_request.request_body, { content_type: "application/json; charset=utf-8" }))
      end
    end

    private

    attr_reader :configuration, :client
  end
end
