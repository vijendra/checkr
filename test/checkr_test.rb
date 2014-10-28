require 'test_helper'

describe Checkr do
  it 'should have a version' do
    Checkr::VERSION.wont_be_nil
  end

  it 'should have api_key' do
    Checkr.respond_to?('api_key').must_equal true
    Checkr.respond_to?('api_key=').must_equal true
  end

  describe '.configure' do
    it 'should set the values' do
      Checkr.api_key.must_equal "83ebeabdec09f6670863766f792ead24d61fe3f9"
    end
  end
end
