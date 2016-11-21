module Inplat
  module Methods
    class Form
      def initialize(params, pay_params)
        @params = params
        @payment_params = payment_params
      end
    end
  end
end
