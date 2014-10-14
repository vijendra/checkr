# -*- encoding: utf-8 -*-
require 'httparty'
require 'ostruct'
module Checkr
  class Subaccount < OpenStruct
    include HTTParty
    base_uri "https://api.checkr.io/v1"
    
    def self.create(params={})
      if valid?(params)
        response = self.post("/subaccounts", :body => params, :basic_auth => {:username => Checkr.api_key } )
        handle_response(response)
      end  
    end
   
    protected
 
    def self.valid?(params)
      true #TODO implement validation
    end
    
    def self.handle_response(response)
      case response.code.to_i
 	    when 200...300 then Checkr::Subaccount.new(response.parsed_response)
      when 401 then raise Checkr::AuthenticationError, "#{response.body}: Verify your api token." 
 	    else
 	      raise Checkr::UnexpectedError, response.body
 	    end
    end
  end
end
