require "cryptsy/version"
require "cryptsy/api_resource"
require "cryptsy/market"
require "cryptsy/market_volume"
require "cryptsy/market_ticker"
require "cryptsy/market_orderbook"
require "cryptsy/market_ohlc"
require "httparty"

module Cryptsy

  @api_base = 'https://api.cryptsy.com/api/v2'

  @api_key = nil

  def self.api_key=(api_key)
    @api_key = api_key
  end

  def self.api_key
    @api_key
  end

  def self.api_base
    @api_base
  end

  def self.get(path)
    response = HTTParty.get("#{@api_base}#{path}")
    body = JSON.parse(response.body)

    body['data']
  end

  def self.post(path, data)
  end

  def self.put(path, data)
  end

  def delete(path)
  end
end
