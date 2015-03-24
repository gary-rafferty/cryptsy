module Cryptsy
  class MarketOhlc

    attr_reader :data

    def initialize(series)
      @data = series
    end

    def self.find(market_id, limit: 100, start: Time.now.to_i - 86400, stop: Time.now.to_i, interval: 'minute')
      path = "/markets/#{market_id}/ohlc"

      query = URI.encode_www_form({limit: limit, start: start, stop: stop, interval: interval})
      path = "#{path}?#{query}"

      response = Cryptsy.get(path)

      self.new(response)
    end

    def min(property: 'volume')
      data.sort_by { |hash| hash[property] }.first
    end

    def max(property: 'volume')
      data.sort_by { |hash| hash[property] }.last
    end

    def average(property: 'volume')
      data.map { |hash| hash[property] }.inject(&:+) / data.length
    end

    def sum(property: 'volume')
      data.map { |hash| hash[property] }.inject(&:+)
    end
  end
end
