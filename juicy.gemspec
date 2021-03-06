# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'juicy/version'

Gem::Specification.new do |spec|
  spec.name          = "juicy"
  spec.version       = Juicy::VERSION
  spec.authors       = ["Marcelo Jacobus"]
  spec.email         = ["marcelo.jacobus@gmail.com"]
  spec.description   = %q{Eases the report making}
  spec.summary       = %q{Eases the report making}
  spec.homepage      = "http://github.com/ocapi/juicy"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", '>= 3.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "simplecov"
end
