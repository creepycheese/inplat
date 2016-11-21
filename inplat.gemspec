# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inplat/version'

Gem::Specification.new do |spec|
  spec.name          = "inplat"
  spec.version       = Inplat::VERSION
  spec.authors       = ["Evgeniy Burdaev"]
  spec.email         = ["hate2me@yandex.ru"]

  spec.summary       = %q{Wrapper for inplat API}
  spec.description   = %q{Wrapper for Inplat API according to its specification}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_runtime_dependency "rest-client"
end
