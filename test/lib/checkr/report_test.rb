describe Checkr::Report do
  before do
    VCR.insert_cassette name
  end

  after do
    VCR.eject_cassette
  end

  describe '.create' do
    let(:report) { Checkr::Report.create(:package => 'driver_plus', :candidate_id => 'e44aa283528e6fde7d542194')}

    it "should create report" do
      report.must_be_instance_of(Checkr::Report)
    end

    it "should respond to report parameters" do
      report.id.must_equal("5878551b3ee1eacae5a2c558")
      report.object.must_equal("test_report")
      report.status.must_equal("pending")
      report.package.must_equal("driver_plus")
    end

  end

  describe '.find' do
    let(:report) { Checkr::Report.find("5878551b3ee1eacae5a2c558")}

    it "should return report object" do
      report.must_be_instance_of(Checkr::Report)
    end

    it "returns report object with parameters" do
      report.id.must_equal("5878551b3ee1eacae5a2c558")

    end
  end

  describe '.update' do
    let(:report) { Checkr::Report.update("5878551b3ee1eacae5a2c558", :package => 'driver_pro')}

    it "should return report object" do
      report.must_be_instance_of(Checkr::Report)
    end

    it "returns report object with updated parameters" do
      report.id.must_equal("5878551b3ee1eacae5a2c558")
      report.package.must_equal("driver_pro")
    end
  end
end
