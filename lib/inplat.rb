require "inplat/version"
require "inplat/configuration"
require "rest-client"
require "json"

module Inplat
  extend self

  def configure(&block)
    block.call(configuration)
  end

  def configuration
    @configuration ||= Configuration.new
  end

  def build
    Api.new(configuration, RestClient::Resource.new(configuration.host))
  end
end
