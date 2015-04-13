require "digest"
require "forever-alone/configuration"
require "forever-alone/version"

module ForeverAlone
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
