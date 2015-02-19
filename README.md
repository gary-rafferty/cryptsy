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

Get all markets

```ruby
Cryptsy::Market.all # returns an array of Market objects
```

Find a single market by id

```ruby
Cryptsy::Market.find('326') # returns a single Market object
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cryptsy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
