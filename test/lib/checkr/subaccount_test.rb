describe Checkr::Subaccount do
  before do
    VCR.insert_cassette name
  end

  after do
    VCR.eject_cassette
  end

  describe '.create' do
    let(:subaccount) { Checkr::Subaccount.create(:name => 'Checkr', :entity_name => 'My Company', :tax_id => 'XXXXX', :representative_title => 'CEO', :representative_name => 'John Smith', :representative_email => 'john.smith@company.org', :phone => '3101111111',
:incorporation_date => '2010-02-02', :incorporation_type => 'llc', :incorporation_state => 'DE', 'address[street]' => '3230 3rd street', 'address[city]' => 'San Francisco', 
 'address[state]' => 'CA', 'address[zipcode]'=> '94110' )}
     
    it "should create subaccount" do
      subaccount.must_be_instance_of(Checkr::Subaccount) 
    end
    
     it "should respond to subaccount parameters" do
      subaccount.id.must_equal("d00650cde3fb6c501d60925b")
      subaccount.authorized.must_equal(true)
    end
  end
end
