# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lazy_injector/version'

Gem::Specification.new do |spec|
  spec.name          = 'lazy_injector'
  spec.version       = LazyInjector::VERSION
  spec.authors       = ['Alexei L']
  spec.email         = ['alexei.lexx@gmail.com']

  spec.summary       = 'Very simple library to inject dependencies'
  spec.description   = 'Very simple library to inject dependencies'
  spec.homepage      = 'https://github.com/alexei-lexx/lazy-injector'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
                                        .reject do |f|
                                          f.match(%r{^(test|spec|features)/})
                                        end

  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
