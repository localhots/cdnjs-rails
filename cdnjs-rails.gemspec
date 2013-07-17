lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cdnjs_rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'cdnjs-rails'
  spec.version       = CdnjsRails::VERSION
  spec.authors       = ['Gregory Eremin']
  spec.email         = ['magnolia_fan@me.com']
  spec.description   = 'This gem adds view helpers to Ruby on Rails'+
                       'applications that embed javascripts and'+
                       'stylesheets directly from cdnjs.com'
  spec.summary       = 'Rails view helpers for embedding cdnjs.com assets'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = []
  spec.test_files    = [] # spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_runtime_dependency 'multi_json'
end
