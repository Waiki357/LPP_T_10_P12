# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'naranja/version'

Gem::Specification.new do |spec|
  spec.name          = "ull-etsii-alu0100315462-naranja"
  spec.version       = Naranja::VERSION
  spec.authors       = ["Alexis Hugh Lopez Waugh, Alvaro Suarez Chausson"]
  spec.email         = ["alu0100315462@ull.edu.es"]
  spec.summary       = %q{Clase Ruby para programación concurrente y paralela.}
  spec.description   = %q{Clase Ruby para la práctica 12 de Lenguajes y Paradigmas de Programación de la Universidad de la Laguna.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec" 
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "coveralls"

end
