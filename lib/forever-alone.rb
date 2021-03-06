require "digest"
require "redis"
require "forever-alone/errors"
require "forever-alone/configuration"
require "forever-alone/validator"
require "forever-alone/version"

module ForeverAlone
  class << self
    attr_writer :configuration
    attr_writer :redis

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def redis
      @redis ||= Redis.new
    end

    def new message, timeout=nil
      Validator.new message, timeout
    end

  end

end
