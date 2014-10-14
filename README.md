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

## Contributing

1. Fork it ( https://github.com/[my-github-username]/checkr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
