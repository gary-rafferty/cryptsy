require './spec/spec_helper.rb'

class ApiResourceSpec < Minitest::Spec

  describe 'api_resource' do
    
    before do
      attrs = {
        "name" => 'nameval',
        "age" => 'age',
        "1var" => 'onevar',
        "number" => 7.0e-8
      }

      @ar = Cryptsy::ApiResource.new(attrs)
    end
    
    it 'should initialize instance variables for each attr' do
      @ar.name.wont_be_nil
    end

    it 'should create a getter for each attr' do
      @ar.must_respond_to "name" 
    end

    it 'prefix numeric identifiers with an underscore' do
      @ar.must_respond_to "_1var"
    end

    it 'should convert scientific notation to decimals for numbers' do
      decimal = "%.8f" % 7.0e-8
      @ar.number.must_equal decimal
    end
  end
end
