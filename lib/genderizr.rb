require 'strscan'
require 'genderizr/version'

module Genderizr

  autoload :Forms, 'genderizr/forms'
  autoload :StringMethods, 'genderizr/string_methods'
  autoload :Version, 'genderizr/version'

  extend Forms

  def self.feminize(string)
    genderize(string, true)
  end


  def self.genderize(string,turn_feminine)
    return "" if string.nil?
    lookup = turn_feminine ? masculine_to_feminine : feminine_to_masculine
    result = ""
    s = StringScanner.new(string)
    until s.eos? do
      word = s.scan(/\w+|\W+/)
      result << (lookup[word].nil? ? word : lookup[word])
    end
    result
  end


  def self.masculize(string)
    genderize(string, false)
  end


  def self.monkey_patch(mod)
    mod.send(:include, Genderizr::StringMethods)
    mod.send(:extend,  Genderizr::Forms)
  end

end

if defined?(Rails)
  Genderizr.monkey_patch(String)
end
