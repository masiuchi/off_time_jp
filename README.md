# OffTimeJp

Off time of Japanese company.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'off_time_jp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install off_time_jp

## Usage

Ruby:
```ruby
require 'date'
require 'off_time_jp'

OffTimeJp.off_time?

OffTimeJp.off_time?(DateTime.new(2017, 6, 18, 17, 50, 00, '+09:00'))
```

Shell:
```bash
$ off_time_jp

$ off_time_jp 2017-06-18T17:50:00+09:00
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/masiuchi/off_time_jp.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

