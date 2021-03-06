require './spec/spec_helper.rb'

class MarketSpec < Minitest::Spec

  describe 'market class' do
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

  describe 'market instance' do
    it 'exposes a .volume() instance method that return a MarketVolume object' do
      Cryptsy.stubs(:get).returns(
        {"name" => "Market1","id" => "M1"}, 
      )

      market = Cryptsy::Market.find('M1')

      Cryptsy.stubs(:get).returns(
        {id: '2', volume: '25.0', volume_btc: '25.0'}
      )

      volume = market.volume

      volume.must_be_instance_of Cryptsy::MarketVolume
    end
  end

  it 'exposes a .ticker() instance method that return a MarketTicker object' do
    Cryptsy.stubs(:get).returns(
      {"name" => "Market1","id" => "M1"}, 
    )

    market = Cryptsy::Market.find('M1')

    Cryptsy.stubs(:get).returns(
      {id: '2', ticker: '25.0', ask: '25.0'}
    )

    ticker = market.ticker

    ticker.must_be_instance_of Cryptsy::MarketTicker
  end

  it 'exposes a .orderbook() instance method that return a MarketOrderbook object' do
    Cryptsy.stubs(:get).returns(
      {"name" => "Market1","id" => "M1"}, 
    )

    market = Cryptsy::Market.find('M1')

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

    orderbook = market.orderbook

    orderbook.must_be_instance_of Cryptsy::MarketOrderbook
  end

  it 'exposes a .ohlc() instance method that return a MarketOhlc object' do
    Cryptsy.stubs(:get).returns(
      {"name" => "Market1","id" => "M1"}, 
    )

    market = Cryptsy::Market.find('M1')
    Cryptsy.stubs(:get).returns(
      [
        {"timestamp" => 1427236560, "date" => "2015-03-24 18:36:00","high" => 7.0e-8,"low" => 7.0e-8,"open" => 7.0e-8,"close" => 7.0e-8,"volume" => 15},
        {"timestamp" => 1427236560, "date" => "2015-03-24 18:36:00","high" => 7.0e-8,"low" => 7.0e-8,"open" => 7.0e-8,"close" => 7.0e-8,"volume" => 15}
      ]
    )

    ohlc = market.ohlc

    ohlc.must_be_instance_of Cryptsy::MarketOhlc
  end
end
