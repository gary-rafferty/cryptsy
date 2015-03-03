require './spec/spec_helper.rb'

class MarketOrderbookSpec < Minitest::Spec

  describe 'market_orderbook class' do
    it 'exposes a .find() method and returns a single MarketOrderbook instance' do
      Cryptsy.stubs(:get).with("/markets/1/orderbook?limit=100&type=Both&mine=false").returns(
        {
          "buy_orders" => [
            {"price"=>241.00000227, "quantity"=>0.0002, "total"=>0.0482},
            {"price"=>241.00000227, "quantity"=>0.0002, "total"=>0.0482} 
          ],
          "sell_orders" => [
            {"price"=>241.00000227, "quantity"=>0.0002, "total"=>0.0482},
            {"price"=>241.00000227, "quantity"=>0.0002, "total"=>0.0482}
          ]
        }
      )

      volume = Cryptsy::MarketOrderbook.find('1')

      volume.must_be_instance_of Cryptsy::MarketOrderbook
    end

    it 'exposes a .find() method with overridable defaults and returns a single MarketOrderbook instance' do
      Cryptsy.stubs(:get).with("/markets/2/orderbook?limit=2&type=Buy&mine=true").returns(
        {
          "buy_orders" => [
            {"price"=>241.00000227, "quantity"=>0.0002, "total"=>0.0482},
            {"price"=>241.00000227, "quantity"=>0.0002, "total"=>0.0482} 
          ]
        }
      )

      volume = Cryptsy::MarketOrderbook.find('2', limit: 2, type: 'Buy', mine: true)

      volume.must_be_instance_of Cryptsy::MarketOrderbook

      assert_raises NoMethodError do
        volume.sellorders
      end
    end

  end
end
 
