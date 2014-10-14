# -*- encoding: utf-8 -*-
require 'httparty'
require 'ostruct'
module Checkr
  class Candidate < OpenStruct
    include HTTParty
    base_uri "https://api.checkr.io/v1"
 
    def self.create(params={})
      if valid?(params)
        uri = "/subaccounts/#{params[:subaccount_id]}" unless params[:subaccount_id].nil?
        uri = "#{uri}/candidates"
        response = self.post(uri, :body => params, :basic_auth => {:username => Checkr.api_key } )
        handle_response(response)
      end  
    end
   
    def self.find(id)
      response = self.get("/candidates/#{id}?include=reports", :basic_auth => {:username => Checkr.api_key } )
      handle_response(response)
    end
    
    protected
 
    def self.valid?(params)
      return true #TODO implement validation
    end
    
    def self.handle_response(response)
     
      case response.code.to_i
 	    when 200...300 
 	      reports = response.parsed_response["reports"]
 	      candidate = Checkr::Candidate.new(response.parsed_response.except('reports'))
 	      candidate.reports = []
 	      unless reports.nil? || reports.empty?
 	        reports.each do |report_attributes|
 	          candidate.reports << Checkr::Report.new(report_attributes)
 	        end
 	      end
 	      
 	      return candidate 
      when 401 then raise Checkr::AuthenticationError, "#{response.body} Verify your api token." 
 	    else
 	      raise Checkr::UnexpectedError, response.body
 	    end
    end
  end
end
