module Checkr
  class MotorVehicleReport < Checkr::Report
    def self.construct(params)
      accidents = params["accidents"]
      violations = params["violations"]
      report = self.new(params.except_key('accidents').except_key('violations'))

 	    report.accidents = []
 	    unless accidents.nil? || accidents.empty?
 	      accidents.each do |accident_attributes|
 	        report.accidents << Checkr::ReportRecord.construct(accident_attributes)
 	      end
 	    end

 	    report.violations = []
 	    unless violations.nil? || violations.empty?
 	      violations.each do |violation_attributes|
 	        report.violations << Checkr::ReportRecord.construct(violation_attributes)
 	      end
 	    end

 	    return report
    end
  end
end
