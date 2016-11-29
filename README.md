# Inplat

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/inplat`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'inplat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inplat

## Usage
First configure gem(e.g. for Rails prokects this can be put into `initializers/inplat.rb`):

```ruby
Inplat.configure do |config|
  config.api_key = "your api key"
  config.secret = "your api secret"
  config.environment = :demo
end
```

Then you can perform requests in the following way:

```ruby
api = Inplat.build

init_params = {
  redirect_url: "google.com",
  pay_type: "card",
  params: { account: "test",
            sum: 10000,
            email: "pay@example.com",
            details: "LALALALLA",
            address: "test" },
  pay_params: { pan: "5457210001000019", expire_month: "12", expire_year: "2025", cvv:"123", cardholder_name: "Test Card" }
}

api.init(init_params)

  # => {"id"=>533728005314193050, "fail_callback_url"=>"http://7359e5b6.ngrok.io/inplat_callbacks",
  # "success_callback_url"=>"http://7359e5b6.ngrok.io/inplat_callbacks",
  # "success_redirect_url"=>"http://7359e5b6.ngrok.io/inplat_redirects", "code"=>0,
  # "fail_redirect_url"=>"http://7359e5b6.ngrok.io/inplat_redirects", "message"=>"Операция выполнена успешно. ",
  # "url"=>"google.com?payment_id=533728005314193050&orderId=af5408c2-e550-444d-8ccb-4edc0adf3602"}
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/creepychese/inplat.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

