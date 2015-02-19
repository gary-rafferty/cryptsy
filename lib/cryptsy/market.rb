module Cryptsy
  class Market < ApiResource
    def initialize(attrs)
      super
    end

    def self.all
      response = Cryptsy.get("/markets")

      response.map { |m| self.new(m) }
    end

    def self.find(id)
      response = Cryptsy.get("/markets/#{id}")

      self.new(response)
    end

    def volume
      response = Cryptsy.get("/markets/#{@id}/volume")

      Cryptsy::MarketVolume.new(response)
    end
  end
end
