module Inplat
  class Api
    POST_METHODS = ["form", "init"].freeze

    def initialize(configuration, client)
      @configuration = configuration
      @client = client
    end

    POST_METHODS.each do |method_name|
      define_method(method_name) do |params|
        client.post(params.to_json, content_type: "application/json")
      end
    end

    private

    attr_reader :configuration, :client
  end
end
