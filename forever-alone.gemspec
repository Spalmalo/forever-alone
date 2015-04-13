# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'forever-alone/version'

Gem::Specification.new do |spec|
  spec.name          = "forever-alone"
  spec.version       = ForeverAlone::VERSION
  spec.authors       = ["Rustam Sharshenov"]
  spec.email         = ["rustam@sharshenov.com"]
  spec.summary       = "Ensure text uniqueness in period of time."
  spec.description   = "This gem uses Redis to keep a list of recent text messages. ForeverAlone calculates hex digests of message and stores them into the Redis with a given expiration period."
  spec.homepage      = "https://github.com/sharshenov/forever-alone"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 3.2.0"
end
