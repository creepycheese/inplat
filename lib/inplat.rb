require "inplat/version"
require "inplat/configuration"
require "inplat/api"
require "rest-client"
require "openssl"
require "Base64"
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
    Api.new(configuration, RestClient)
  end
end
