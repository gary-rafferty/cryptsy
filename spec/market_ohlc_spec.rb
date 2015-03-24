require './spec/spec_helper.rb'

class MarketOhlcSpec < Minitest::Spec

  describe 'market_ohlc class' do
    it 'exposes a .find() method and returns a single MarketOhlc instance' do
      Cryptsy.stubs(:get).returns(
        [
          {"timestamp" => 1427236560, "date" => "2015-03-24 18:36:00","high" => 7.0e-8,"low" => 7.0e-8,"open" => 7.0e-8,"close" => 7.0e-8,"volume" => 15},
          {"timestamp" => 1427236560, "date" => "2015-03-24 18:36:00","high" => 7.0e-8,"low" => 7.0e-8,"open" => 7.0e-8,"close" => 7.0e-8,"volume" => 15}
        ]
      )

      ohlc = Cryptsy::MarketOhlc.find('1')

      ohlc.must_be_instance_of Cryptsy::MarketOhlc
    end
  end

  describe 'market_ohlc instance' do
    before do
      Cryptsy.stubs(:get).returns(
        [
          {"timestamp" => 1427236560, "date" => "2015-03-24 18:36:00","high" => 7.0e-8,"low" => 7.0e-8,"open" => 7.0e-8,"close" => 7.0e-8,"volume" => 15},
          {"timestamp" => 1427236560, "date" => "2015-03-24 18:36:00","high" => 7.0e-8,"low" => 7.0e-8,"open" => 7.0e-8,"close" => 7.0e-8,"volume" => 15}
        ]
      )

      @ohlc = Cryptsy::MarketOhlc.find('1')
    end

    it 'exposes a min method that returns a hash' do
      @ohlc.must_respond_to 'min'
      @ohlc.min.must_be_instance_of Hash
    end
  
    it 'exposes a max method that returns a hash' do
      @ohlc.must_respond_to 'max'
      @ohlc.max.must_be_instance_of Hash
    end

    it 'exposes a sum method that returns a number' do
      @ohlc.must_respond_to 'sum'
      @ohlc.sum.must_be_instance_of Fixnum
      @ohlc.sum.must_equal 30
    end

    it 'exposes an average method that returns a number' do
      @ohlc.must_respond_to 'average'
      @ohlc.average.must_be_instance_of Fixnum
      @ohlc.average.must_equal 15
    end
  end
end
 
