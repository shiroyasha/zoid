# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zoid/version'

Gem::Specification.new do |spec|
  spec.name          = "zoid"
  spec.version       = Zoid::VERSION
  spec.authors       = ["Igor Sarcevic"]
  spec.email         = ["igisar@gmail.com"]

  spec.summary       = %q{Friendly Json Api consumer}
  spec.description   = %q{Friendly Json Api consumer}
  spec.homepage      = "https://github.com/shiroyasha/zoid"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "httpclient"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
