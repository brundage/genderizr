$:.unshift('lib')
require 'genderizr'
Dir["./spec/shared/*.rb"].each { |f| require f }
