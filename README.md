# Fastcov

Fastcov is an extremely simple alternative to [SimpleCov](https://github.com/colszowka/simplecov) that provides almost none of its convenient features in order to go faster.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fastcov', require: false, group: :test
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fastcov

## Usage

At the top of your test helper (or spec helper), require and start Fastcov.

```
require 'fastcov'
Fastcov.start
```

**Note:** If Fastcov starts after your application code is already loaded (via require), it won't be able to track your files and their coverage! The `Fastcov.start` must be issued before any of your application code is required!

Fastcov will record coverage and by default, at program exit, it will output one file per process that it was run in.
The output file is a json file saved to `/tmp/fastcov-[PID].json`

Unlike SimpleCov, no merging, filtering, or code skipping is supported.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Attribution

Some text from this readme is directly copied from [SimpleCov](https://github.com/colszowka/simplecov), as well as the general inspiration for the gem.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mcgain/fastcov.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

