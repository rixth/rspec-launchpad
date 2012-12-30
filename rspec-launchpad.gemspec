# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec-launchpad/version'

Gem::Specification.new do |gem|
  gem.name          = "rspec-launchpad"
  gem.version       = RSpec::Launchpad::VERSION
  gem.authors       = ["Thomas Rix"]
  gem.email         = ["tom@rixth.org"]
  gem.description   = %q{Show RSpec results on a Novation Launchpad}
  gem.summary       = gem.description
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'ffi'
  gem.add_dependency 'portmidi'
  gem.add_dependency 'launchpad'
end
