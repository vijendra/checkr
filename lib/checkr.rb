require "checkr/version"
require "checkr/core_ext"
require "checkr/candidate"
require "checkr/subaccount"
require "checkr/report"

module Checkr
  class << self
    attr_accessor :api_key, :test
 
    def configure
      yield self
      raise Checkr::Error.new(':api_key cannot be blank') if api_key.nil? || api_key.empty?
    end
    
    alias :config :configure
    
    def auth
       {:username => Checkr.api_key }
    end
  end
  
  class Error < RuntimeError; end
  class AuthenticationError < StandardError;  end
  class UnexpectedError < StandardError;  end
  class ParamsError < StandardError;  end
end
