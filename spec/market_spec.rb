require './spec/spec_helper.rb'

class MarketSpec < Minitest::Spec

  describe 'market' do
    it 'exposes .all() and returns market objects' do
      Cryptsy.stubs(:get).returns(
        [
          {"name" => "Market1","id" => "M1"}, 
          {"name" => "Market2","id" => "M2"}
        ]
      )

      markets = Cryptsy::Market.all

      markets.first.must_be_instance_of Cryptsy::Market
    end

    it 'exposes .find() and returns a market object' do
      Cryptsy.stubs(:get).returns(
        {"name" => "Market1","id" => "M1"}, 
      )

      market = Cryptsy::Market.find('M1')

      market.must_be_instance_of Cryptsy::Market
    end

  end
end
