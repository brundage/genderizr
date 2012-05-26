$:.push File.expand_path("../lib", __FILE__)
require 'genderizr'

Gem::Specification.new do |s|
  s.name          = "genderizr"
  s.summary       = "A gem to genderize strings"
  s.description   = "Having gender issues in your ruby app? Genderizr to the rescue!"

  s.homepage          = "https://github.com/brundage/genderizr"
  s.rubyforge_project = "genderizr"

  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rspec'  # Why doesn't guard-rspec depend on rspec?

  s.authors       = ["Dean Brundage"]
  s.email         = ["dean@newrepublicbrewing.com"]

  s.files         = Dir[ 'README.md', 'lib/**/*.rb' ]
  s.test_files    = Dir[ 'spec/**/*.rb' ]
  s.require_paths = ["lib"]

  s.platform      = Gem::Platform::RUBY
  s.version       = Genderizr::VERSION
end
