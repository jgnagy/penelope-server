# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'penelope/server/version'

Gem::Specification.new do |spec|
  spec.name          = "penelope-server"
  spec.version       = Penelope::Server::VERSION
  spec.authors       = ["Jonathan Gnagy"]
  spec.email         = ["jonathan.gnagy@gmail.com"]

  spec.summary       = %q{Penelope Server library}
  spec.homepage      = 'https://github.com/jgnagy/penelope-server'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.platform              = %q{java}
  spec.required_ruby_version = '~> 2.0'

  spec.add_runtime_dependency 'penelope-core'
  spec.add_runtime_dependency 'sinatra', '~> 1.4'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency 'rubocop', '~> 0.35'
  spec.add_development_dependency 'yard',    '~> 0.8'
  spec.add_development_dependency 'travis', '~> 1.8'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'warbler', '~> 2.0'
end
