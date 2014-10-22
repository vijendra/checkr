require 'httparty'
require 'ostruct'

module Checkr
  class Base < OpenStruct
    include HTTParty
    base_uri "https://api.checkr.io/v1"
 
    def self.construct(params)
      new(params)
    end
    
    private
  
    def self.handle_response(response)
      case response.code.to_i
 	    when 200...300 then self.construct(response.parsed_response)
      when 401 then raise Checkr::AuthenticationError, "#{response.body}: Verify your api token." 
 	    else
 	      raise Checkr::UnexpectedError, response.body
 	    end
 	  end
  end
end
