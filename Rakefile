require "bundler/gem_tasks"
require 'rspec/core/rake_task'
require 'erb'
require './lib/genderizr/version'

task :default => :build
task :build => :spec

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "./spec/*_spec.rb"
end
