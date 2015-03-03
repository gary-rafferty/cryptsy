module Cryptsy
  class MarketOrderbook < ApiResource
    def initialize(attrs)
      super
    end

    def self.find(market_id)
      response = Cryptsy.get("/markets/#{market_id}/orderbook")

      self.new(response)
    end
  end
end
