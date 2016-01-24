# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gateway/version'

Gem::Specification.new do |spec|
  spec.name          = "gateway-sdk"
  spec.version       = Gateway::VERSION
  spec.authors       = ["atanych"]
  spec.email         = ["atanych@gmail.com"]

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  # end

  spec.summary       = 'gateway SDK'
  spec.description   = 'SDK for interaction with gateway'
  spec.homepage      = 'https://github.com/atanych/gateway_sdk.git'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "redcarpet"
  spec.add_development_dependency "yard"
end
