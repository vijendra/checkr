describe Checkr::Candidate do
  before do
    VCR.insert_cassette name
  end

  after do
    VCR.eject_cassette
  end

  describe '.create' do
     let(:params) { {:first_name => 'John', :last_name => 'Smith', :dob => '1970-01-22', :ssn => '111-11-2000', :phone => '5555555555', :email => 'john@smith.org' } }

    describe 'without subacount' do
      let(:candidate) { Checkr::Candidate.create(params)}

      it "should create candidate" do
        candidate.must_be_instance_of(Checkr::Candidate)
      end

      it "should respond to parameters" do
        candidate.id.must_equal("48e1768591583c31ada8810f")
        candidate.object.must_equal("test_candidate")
        candidate.first_name.must_equal("John")
        candidate.last_name.must_equal("Smith")
        candidate.middle_name.must_equal(nil)
        candidate.dob.must_equal("1970-01-22")
        candidate.ssn.must_equal("XXX-XX-2000")
        candidate.email.must_equal("john@smith.org")
        candidate.phone.must_equal("5555555555")
      end
    end

    describe 'with subacount' do
      let(:candidate) { Checkr::Candidate.create(params.merge(:subaccount_id => '8168372aac5a952b90eb9acb') )}

      it "should create candidate for the subaccount" do
        candidate.must_be_instance_of(Checkr::Candidate)
      end

       it "should respond to candidate parameters belongs to subaccount" do
        candidate.id.must_equal("aa10fd0d98ea6e4753718a23")
      end
    end
  end

  describe '.find' do
    let(:candidate) { Checkr::Candidate.find("e44aa283528e6fde7d542194")}

    it "should return candidate object" do
      candidate.must_be_instance_of(Checkr::Candidate)
    end

    it "returns candidate object with checkr parameters" do
      candidate.id.must_equal("e44aa283528e6fde7d542194")
      candidate.object.must_equal("test_candidate")
      candidate.first_name.must_equal("John")
      candidate.last_name.must_equal("Smith")
      candidate.middle_name.must_equal("Alfred")
      candidate.dob.must_equal("1970-01-22")
      candidate.ssn.must_equal("XXX-XX-4645")
      candidate.email.must_equal("john.smith@gmail.com")
      candidate.phone.must_equal(nil)
    end
  end

end
