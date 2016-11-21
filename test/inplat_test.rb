require 'test_helper'

class InplatTest < Minitest::Test
  def test_that_it_can_be_configured
    Inplat.configure do |config|
      config.api_key = "key"
      config.secret = "secret"
      config.environment = :demo
    end

    assert_equal(Inplat.configuration.api_key, "key")
  end
end
