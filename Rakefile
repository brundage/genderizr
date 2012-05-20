require 'erb'
require './lib/genderizr/version'

GEM         = "genderizr-#{Genderizr::VERSION}.gem"
GEMSPEC     = "genderizr.gemspec"
FILES       = `git ls-files`.split(/\n/)


task :build => :default
task :default => GEM

task :deploy => GEM do
  system "gem push #{GEM}"
end

task :install => GEM do
  system "gem install #{GEM}"
end

file GEM => FILES do |task|
  system "gem build -V #{GEMSPEC}"
end
