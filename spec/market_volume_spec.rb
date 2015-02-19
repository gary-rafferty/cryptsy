require './spec/spec_helper.rb'

class MarketVolumeSpec < Minitest::Spec

  describe 'market_volume class' do
    it 'exposes a .all() method and returns MarketVolume instances' do
      Cryptsy.stubs(:get).returns(
        [
          {id: '1', volume: '25.0', volume_btc: '25.0'},
          {id: '2', volume: '50.0', volume_btc: '50.0'}
        ]
      )

      volumes = Cryptsy::MarketVolume.all

      volumes.first.must_be_instance_of Cryptsy::MarketVolume
    end

    it 'exposes a .find() method and returns a single MarketVolume instance' do
      Cryptsy.stubs(:get).returns(
        {id: '1', volume: '25.0', volume_btc: '25.0'},
      )

      volume = Cryptsy::MarketVolume.find('1')

      volume.must_be_instance_of Cryptsy::MarketVolume
    end
  end
end
 
