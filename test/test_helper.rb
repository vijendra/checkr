require 'minitest/autorun'
require 'minitest/pride'
require 'minispec-metadata'
require 'checkr'
require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

Checkr.configure do |c|
	c.api_key   = "83ebeabdec09f6670863766f792ead24d61fe3f9" #Test token from checkr document
end
