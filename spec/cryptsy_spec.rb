require './spec/spec_helper.rb'

class CryptsySpec < Minitest::Spec

  describe 'cryptsy' do
    it 'should have an api_base' do
      Cryptsy.api_base.wont_be_nil
      Cryptsy.api_base.must_equal 'https://api.cryptsy.com/api/v2'
    end

    it 'should not set an api_key' do
      Cryptsy.api_key.must_be_nil
    end

    it 'should provide a setter for api_key' do
      Cryptsy.api_key= 'api_key'
      Cryptsy.api_key.wont_be_nil
      Cryptsy.api_key.must_equal 'api_key'
    end
  end
end
