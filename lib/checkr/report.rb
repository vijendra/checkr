# -*- encoding: utf-8 -*-
require 'httparty'
require 'ostruct'
module Checkr
  class Report < OpenStruct
   include HTTParty
   base_uri "https://api.checkr.io/v1"
 
   def self.create(params={})
      if valid?(params)
        response = self.post("/reports", :body => params, :basic_auth => Checkr.auth )
        handle_response(response)
      end  
    end
   
    def self.find(id)
      response = self.get("/reports/#{id}", :basic_auth => Checkr.auth )
      handle_response(response)
    end
    
    protected
 
    def self.valid?(params)
      return true #TODO implement validation
    end
    
    def self.handle_response(response)
      case response.code.to_i
 	    when 200...300 then Checkr::Report.new(response.parsed_response)
      when 401 then raise Checkr::AuthenticationError, "#{response.body} Verify your api token." 
 	    else
 	      raise Checkr::UnexpectedError, response.body
 	    end
    end
  end
end
