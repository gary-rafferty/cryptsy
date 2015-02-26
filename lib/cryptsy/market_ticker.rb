module Cryptsy
  class MarketTicker < ApiResource
    def initialize(attrs)
      super
    end

    def self.all
      response = Cryptsy.get("/markets/ticker")

      response.map { |mv| self.new(mv) }
    end

    def self.find(market_id)
      response = Cryptsy.get("/markets/#{market_id}/ticker")

      self.new(response)
    end
  end
end
