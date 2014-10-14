# Checkr

Ruby wrapper for checkr.io API (https://checkr.io/docs)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'checkr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install checkr

## Usage

**Configure authentication keys**

  ```Ruby
  Checkr.configure do |c|
    c.api_key   = "83ebeabdec09f6670863766f792ead24d61fe3f9" #Test token from checkr api document
  end
  ```
  
**Create subaccount**

  ```Ruby
  subaccount = Checkr::Subaccount.create(:name => 'Checkr', :entity_name => 'My Company', :tax_id => 'XXXXX', :representative_title => 'CEO', :representative_name => 'John Smith', :representative_email => 'john.smith@company.org', :phone => '3101111111',
:incorporation_date => '2010-02-02', :incorporation_type => 'llc', :incorporation_state => 'DE', 'address[street]' => '3230 3rd street', 'address[city]' => 'San Francisco', 
 'address[state]' => 'CA', 'address[zipcode]'=> '94110')
 
  #Subaccount attributes
  subaccount_id = subaccount.id 
  ```

**Create candidate for subaccount**

  ```Ruby
  candidate = Checkr::Subaccount.create(:first_name => 'John', :last_name => 'Smith', :dob => '1970-01-22', :ssn => '111-11-2000', :phone => '5555555555', :email => 'john@smith.org', :subaccount_id => '8168372aac5a952b90eb9acb')
 
  #candidate attributes
  candidate_id = candidate.id 
  ```

**Create candidate**

  ```Ruby
  candidate = Checkr::Subaccount.create(:first_name => 'John', :last_name => 'Smith', :dob => '1970-01-22', :ssn => '111-11-2000', :phone => '5555555555', :email => 'john@smith.org')
 
  #candidate attributes
  candidate_id = candidate.id 
  ```    
 
**Find candidate**

  ```Ruby
  candidate = Checkr::Candidate.find('e44aa283528e6fde7d542194')
  candidate.id #Returns checkr id of the candidate
  candidate.first_name #Returns first_name of the candidate
  ```

**Get all reports belongs to candidate, if exists**

  ```Ruby
  candidate = Checkr::Subaccount.find('e44aa283528e6fde7d542194')
  candidate.reports #Returns array of Checkr::Report objects
  ```
**Create report**

  ```Ruby
  report = Checkr::Report.create(:package => 'driver_plus', :candidate_id => 'e44aa283528e6fde7d542194')
  report.id #Returns the checkr id of the created report
  ```

**Find report**

  ```Ruby
  report = Checkr::Report.find("5878551b3ee1eacae5a2c558")
  report.id #Returns the checkr id of the created report
  report.status #Returns the check status of the report
  ```
## Contributing

1. Fork it ( https://github.com/[my-github-username]/checkr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
