# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hello_sign/version'

Gem::Specification.new do |spec|
  spec.name          = 'hellosign-ruby-sdk'
  spec.version       = HelloSign::VERSION
  spec.authors       = 'HelloSign'
  spec.email         = 'support@hellosign.com'
  spec.summary       = 'A Ruby SDK for the HelloSign API.'
  spec.description   = ''
  spec.homepage      = 'http://www.hellosign.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'multi_json'
end
