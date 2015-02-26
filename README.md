# Cryptsy 

[![Build Status](https://travis-ci.org/gary-rafferty/cryptsy.svg?branch=master)](https://travis-ci.org/gary-rafferty/cryptsy)
[![Coverage Status](https://coveralls.io/repos/gary-rafferty/cryptsy/badge.svg)](https://coveralls.io/r/gary-rafferty/cryptsy)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptsy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptsy

## Usage

### Markets

```ruby
# Get all Markets
Cryptsy::Market.all # returns an array of Market objects

# Find a single market by id
market = Cryptsy::Market.find(326) # returns a single Market object

market.instance_variables # [id, label, coin_currency_id, market_currency_id, maintenance_mode, verified_only, _24hr, last_trade]

# Get the market volume
market.market_volume # returns a MarketVolume object

# Get the market ticker
market.market_ticker # returns a MarketTicket object
```

### MarketVolumes

```ruby
# Get all MarketVolumes
Cryptsy::MarketVolume.all # returns an array of MarketVolume objects

# Find a single market volume by market id
market_volume = Cryptsy::MarketVolume.find(2)

market_volume.instance_variables # [volume, volume_btc]
```

### MarketTickers

```ruby
# Get all MarketTickers
Cryptsy::MarketTicker.all # returns an array of MarketTicker objects

# Find a single market ticker by market id
market_ticker = Cryptsy::MarketTicker.find(2)

market_ticker.instance_variables # [bid, ask]
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cryptsy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
