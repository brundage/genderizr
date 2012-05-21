$:.push File.expand_path("../lib", __FILE__)
require 'genderizr'

Gem::Specification.new do |s|
  s.name          = "genderizr"
  s.summary       = "A gem to genderize strings"
  s.description   = "Having gender issues in your ruby app? Genderizr to the rescue!"
  s.homepage      = "https://github.com/brundage/genderizr"

  s.add_development_dependency 'rspec'

  s.authors       = ["Dean Brundage"]
  s.email         = ["dean@newrepublicbrewing.com"]

  s.files         = Dir[ 'README.md', 'lib/**/*' ]
  s.require_paths = ["lib"]

  s.platform      = Gem::Platform::RUBY
  s.version       = Genderizr::VERSION
end
