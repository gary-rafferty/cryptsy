module Cryptsy
  class MarketOrderbook < ApiResource

    def initialize(attrs)
      super
    end

    def self.find(market_id, limit: 100, type: 'Both', mine: false)
      path = "/markets/#{market_id}/orderbook"
      
      query = URI.encode_www_form({limit: limit, type: type, mine: mine})
      path = "#{path}?#{query}"

      response = Cryptsy.get(path)

      self.new(response)
    end
  end
end
