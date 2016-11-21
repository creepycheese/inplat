module Inplat
  class Configuration
    HOSTS = { production: "https://demo-api2.inplat.ru", demo: "https://demo-api2.inplat.ru"}
    attr_accessor :api_key, :secret, :environment

    def host
      HOSTS[environment]
    end
  end
end
