require './spec/spec_helper.rb'

class MarketTickerSpec < Minitest::Spec

  describe 'market_volume class' do
    it 'exposes a .all() method and returns MarketTicker instances' do
      Cryptsy.stubs(:get).returns(
        [
          {id: '1', ticker: '25.0', ask: '25.0'},
          {id: '2', ticker: '50.0', ask: '50.0'}
        ]
      )

      volumes = Cryptsy::MarketTicker.all

      volumes.first.must_be_instance_of Cryptsy::MarketTicker
    end

    it 'exposes a .find() method and returns a single MarketTicker instance' do
      Cryptsy.stubs(:get).returns(
        {id: '1', ticker: '25.0', ask: '25.0'},
      )

      volume = Cryptsy::MarketTicker.find('1')

      volume.must_be_instance_of Cryptsy::MarketTicker
    end
  end
end
 
