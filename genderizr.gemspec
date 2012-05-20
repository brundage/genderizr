$:.push File.expand_path("../lib", __FILE__)
require "genderizr/version"

Gem::Specification.new do |s|
  s.name        = "genderizr"
  s.version     = Genderizr::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dean Brundage"]
  s.email       = ["dean@newrepublicbrewing.com"]
  s.homepage    = "https://github.com/brundage/genderizr"
  s.summary     = "Genderize text"
  s.description = "A gem to genderize strings"

  s.files         = [ 'README.md',
                      'Rakefile',
                      'lib/genderizr.rb',
                      'lib/genderizr/railtie.rb',
                      'lib/genderizr/version.rb' ]
  s.test_files    = [  ]
  s.executables   = [  ]
  s.require_paths = ["lib"]
end
