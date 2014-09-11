# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alchemia/version'

Gem::Specification.new do |spec|
  spec.name          = "alchemia"
  spec.version       = Alchemia::VERSION
  spec.authors       = ["Masaaki Morishita"]
  spec.email         = ["ikasama3.0@gmail.com"]
  spec.summary       = %q{Plugin framework for building AltCSS}
  spec.description   = %q{Plugin framework for building AltCSS in Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
