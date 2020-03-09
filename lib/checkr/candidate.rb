# -*- encoding: utf-8 -*-
module Checkr
  class Candidate < Checkr::Base

    ArgumentError = Class.new RuntimeError

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

    PERMITTED_KEYS = %w(email full_name adjudication custom_id created_after created_before geo_id program_id)
    ###
    # Implements https://docs.checkr.com/#operation/listOfCandidates
    # Accepted keys:
    #   * email
    #   * full_name
    #   * adjudication
    #   * custom_id
    #   * created_after
    #   * created_before
    #   * geo_id
    #   * program_id
    ###
    def self.where(params)
      if params.is_a?(Hash)
        unsupported_keys = params.stringify_keys.keys - PERMITTED_KEYS
        if unsupported_keys.any?
          raise ArgumentError, "Unsupported parameter(s) #{unsupported_keys.inspect}"
        end
      else
        raise ArgumentError, 'Arguments must be a hash'
      end

      response = self.get("/candidates?#{params.to_query}", basic_auth: { username: Checkr.api_key } )
      handle_response(response).data.map { |candidate| self.new candidate }
    end

    def self.find_by(params)
      where(params).first
    end

    protected

    def self.valid?(params)
      return true #TODO implement validation
    end

  end
end
