# -*- encoding: utf-8 -*-
module Checkr
  class Subaccount < Checkr::Base

    def self.create(params={})
      if valid?(params)
        response = self.post("/subaccounts", :body => params, :basic_auth => Checkr.auth )
        handle_response(response)
      end
    end

    protected

    def self.valid?(params)
      true #TODO implement validation
    end

  end
end
