describe Checkr::MotorVehicleReport do
  before do
    VCR.insert_cassette name
  end

  after do
    VCR.eject_cassette
  end
 
  describe '.find' do
    let(:report) { Checkr::MotorVehicleReport.find("539fd88c101897f7cd000007")}
    
    it "should return motor vehicle report object" do
      report.must_be_instance_of(Checkr::MotorVehicleReport) 
    end
    
    it "returns motor vehicle report object with parameters" do
      report.id.must_equal("539fd88c101897f7cd000007")
      
    end
  end
  
end
