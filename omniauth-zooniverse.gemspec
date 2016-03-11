# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/zooniverse/version'

Gem::Specification.new do |spec|
  # https://github.com/intridea/omniauth-oauth2/issues/81
  # 1.4.0 has a bug that prevents login
  spec.add_dependency "omniauth-oauth2", "1.3.1"

  spec.name          = "omniauth-zooniverse"
  spec.version       = Omniauth::Zooniverse::VERSION
  spec.authors       = ["Stuart Lynn"]
  spec.email         = ["stuart@zooniverse.org"]
  spec.summary       = %q{Provides an OAuth2.0 strategy for the zooniverse}
  spec.description   = %q{Allows thrid parties to authenticate against and access resources on the zooniverse platform}
  spec.homepage      = "https://github.com/zooniverse/omniauth-zooniverse"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
