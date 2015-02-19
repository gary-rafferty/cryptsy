module Cryptsy
  class MarketVolume < ApiResource
    def initialize(attrs)
      super
    end

    def self.all
      response = Cryptsy.get("/markets/volume")

      response.map { |mv| self.new(mv) }
    end

    def self.find(market_id)
      response = Cryptsy.get("/markets/#{market_id}/volume")

      self.new(response)
    end
  end
end
