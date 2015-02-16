# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptsy/version'

Gem::Specification.new do |spec|
  spec.name          = "cryptsy"
  spec.version       = Cryptsy::VERSION
  spec.authors       = ["Gary Rafferty"]
  spec.email         = ["gary.rafferty@gmail.com"]
  spec.summary       = %q{Ruby client for Cryptsy's v2 API}
  spec.description   = %q{Ruby client for Cryptsy's v2 API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13.3"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "mocha", "~> 1.1.0"
end
