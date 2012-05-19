require 'erb'
require './lib/genderizr/version'

GEM         = "genderizr-#{Genderizr::VERSION}.gem"
GEMSPEC     = "genderizr.gemspec"
GEMSPEC_ERB = GEMSPEC + ".erb"
FILES       = `git ls-files`.split(/\n/).delete_if { |f| [GEMSPEC].include?(f) }


task :build => :default
task :default => GEM

task :install => GEM do
  system "gem install #{GEM}"
end

file GEM => GEMSPEC do |task|
  system "gem build -V #{GEMSPEC}"
end

file GEMSPEC => FILES do |task|
  input  = File.open(GEMSPEC_ERB, "r")
  output = File.open(task.to_s, "w")
  output.write( ERB.new( input.read ).result )
end
