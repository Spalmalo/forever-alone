# ForeverAlone
[![Build Status](https://travis-ci.org/Spalmalo/forever-alone.svg)](https://travis-ci.org/Spalmalo/forever-alone)

This gem uses Redis to keep a list of recent text messages. ForeverAlone calculates hex digests of message and stores them into the Redis with a given expiration period.

## Installation

Add this line to your application's Gemfile:

    gem 'forever-alone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install forever-alone

## Usage


```ruby
  # init ForeverAlone with default timeout(30 minutes)
  forever_alone = ForeverAlone.new("some message")

  # or with custom timeout
  forever_alone = ForeverAlone.new("some message", 5.minutes)

  # check if given message is unique
  forever_alone.unique?

  # remember this message
  forever_alone.remember

  # OR just ensure that message is unique and raise ForeverAlone::MessageIsNotUnique error otherwise
  forever_alone.ensure
```

## Configuration

Here is ForeverAlone default configuration:

```ruby
ForeverAlone.configure do |config|
  config.digest     = Digest::MD5 # you can switch to Digest::SHA1
  config.timeout    = 1_800       # default expiration period
  config.namespace  = :locks      # prefix to Redis keys "locks:df49b60423903e095b80d9b4a92eb065"
end
```

You can configure redis connection with `REDIS_URL` environment variable.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/forever-alone/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
