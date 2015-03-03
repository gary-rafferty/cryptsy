require './spec/spec_helper.rb'

class MarketOrderbookSpec < Minitest::Spec

  describe 'market_orderbook class' do
    it 'exposes a .find() method and returns a single MarketOrderbook instance' do
      Cryptsy.stubs(:get).returns(
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
  end
end
 
