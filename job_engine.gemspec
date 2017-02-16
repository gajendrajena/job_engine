# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'job_engine/version'

Gem::Specification.new do |spec|
  spec.name          = 'job_engine'
  spec.version       = JobEngine::VERSION
  spec.authors       = ['Benjamin Oakes']
  spec.email         = ['hello@benjaminoakes.com']

  spec.summary       = 'A Middleman extension for generating a static job board.'
  spec.homepage      = 'https://github.com/techcorridorio/job_engine'
  spec.license       = 'GPLv2'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'guard', '~> 2.14'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
end
