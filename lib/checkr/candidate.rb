# -*- encoding: utf-8 -*-
module Checkr
  class Candidate < Checkr::Base
 
    def self.create(params={})
      if valid?(params)
        uri = "/subaccounts/#{params[:subaccount_id]}" unless params[:subaccount_id].nil?
        uri = "#{uri}/candidates"
        response = self.post(uri, :body => params, :basic_auth => Checkr.auth )
        handle_response(response)
      end  
    end
   
    def self.find(id)
      response = self.get("/candidates/#{id}?include=reports", :basic_auth => {:username => Checkr.api_key } )
      handle_response(response)
    end
 
    def self.construct(params)
      reports = params["reports"]
 	    candidate = self.new(params.except_key('reports'))
 	    candidate.reports = []
 	    unless reports.nil? || reports.empty?
 	      reports.each do |report_attributes|
 	        candidate.reports << Checkr::Report.new(report_attributes)
 	      end
 	    end
 	      
 	    return candidate 
    end
    
    protected
 
    def self.valid?(params)
      return true #TODO implement validation
    end
 
  end
end
