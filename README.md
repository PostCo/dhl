# DHLAPI

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/dhl_api`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dhl_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install dhl_api

## Usage

```ruby
DHLAPI.configure do |config|
    config.api_key = "your api key"
    config.testing = true # or false
end

# DHL Retoure (https://developer.dhl.com/api-reference/dhl-parcel-de-returns-post-parcel-germany)
#
retoure_client = DHLAPI::RetoureClient.new(username: 'retoure username', password: 'retoure password')
#
# OR if you only creating label for 1 account all the time,
# you can set the ENV variables: DHLAPI_RETOURE_USERNAME, DHLAPI_RETOURE_PASSWORD,
# and then just initialize the client like below:
#
# retoure_client = DHLAPI::RetoureClient.new

label = retoure_client.create_label(
  "receiver_id": 'deu',
  "customer_reference": 'Kundenreferenz',
  "shipment_reference": 'Sendungsreferenz',
  "shipper": {
    "name1": 'Absender Retoure Zeile 1',
    "name2": 'Absender Retoure Zeile 2',
    "name3": 'Absender Retoure Zeile 3',
    "address_street": 'Charles-de-Gaulle Str.',
    "address_house": '20',
    "city": 'Bonn',
    "email": 'Max.Mustermann@dhl_api.local',
    "phone": '+49 421 987654321',
    "postal_code": '53113',
    "state": 'NRW'
  },
  "item_weight": {
    "uom": 'g',
    "value": 1000
  },
  "item_value": {
    "currency": 'EUR',
    "value": 100
  }
)

# Tracking (https://developer.dhl.com/api-reference/shipment-tracking)
#
track_client=DHLAPI::TrackingClient.new
# Also accept service:, origin_country_code:, requester_country_code:
tracking = track_client.track(tracking_number: '420025369374810912402173942693')

# You can access the raw response by calling by calling the #response:
retoure_client.response
track_client.response
# It is a HTTP::Response object. See https://github.com/httprb/http/wiki/Response-Handling for more info.

# You can access the raw attributes before the keys is parsed to snake_case by calling the #attributes:
label.attributes
tracking.attributes
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/postco/dhl_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/postco/dhl_api/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DHLAPI project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/postco/dhl_api/blob/main/CODE_OF_CONDUCT.md).
