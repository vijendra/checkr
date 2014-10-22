# -*- encoding: utf-8 -*-
module Checkr
  class ReportRecord < Checkr::Base
    def self.construct(params)
      charges = params["charges"]
 	    record = self.new(params.except_key('charges'))
 	    record.charges = []
 	    unless charges.nil? || charges.empty?
 	      charges.each do |charge_attributes|
 	        record.charges << Checkr::ReportCharge.construct(record_attributes)
 	      end
 	    end
 	      
 	    return record 
    end
  end
end
