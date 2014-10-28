require "checkr/base"
require "checkr/version"
require "checkr/core_ext"
require "checkr/candidate"
require "checkr/subaccount"
require "checkr/report"
require "checkr/motor_vehicle_report"
require "checkr/sex_offender search"
require "checkr/ssn_trace"
require "checkr/terrorist_watchlist_search"
require "checkr/national_criminal_search"
require "checkr/county_criminal_search"
require "checkr/report_charge"
require "checkr/report_record"

module Checkr
  class << self
    attr_accessor :api_key, :api_version

    def configure
      yield self
      api_version = 'v1' if api_version.nil? || api_version.empty?
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
