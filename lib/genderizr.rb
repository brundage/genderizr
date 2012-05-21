require 'strscan'

module Genderizr

  VERSION = "0.0.6"

  extend self

  def feminize(string)
    genderize(string, true)
  end


  def genderize(string,turn_feminine)
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


  def masculize(string)
    genderize(string, false)
  end


  module StringMethods
    def feminize; Genderizr.feminize(self); end
    def genderize(turn_feminine); Genderizr.genderize(self,turn_feminine); end
    def masculize; Genderizr.masculize(self); end
  end


private

  def feminine_to_masculine
    @f2m ||= masculine_to_feminine.invert
  end

  def masculine_to_feminine
    {
      'boy' => 'girl',
      'boyish' => 'girlish',
      'boys' => 'girls',
      'brother' => 'sister',
      'brothers' => 'sisters',
      'cowboy' => 'cowgirl',
      'cowboys' => 'cowgirls',
      'craftsman' => 'craftswoman',
      'dad' => 'mom',
      'daddy' => 'mommy',
      'dick' => 'pussy',
      'dude' => 'lady',
      'dudes' => 'ladies',
      'ex-wife' => 'ex-husband',
      'father' => 'mother',
      'fathers' => 'mothers',
      'gentleman' => 'lady',
      'gentlemen' => 'ladies',
      'guy' => 'gal',
      'guys' => 'gals',
      'he' => 'she',
      'him' => 'her',
      'himself' => 'herself',
      'his' => 'her',
      'king' => 'queen',
      'kings' => 'queens',
      'male' => 'female',
      'man' => 'woman',
      'manhood' => 'womanhood',
      'manlier' => 'womanlier',
      'manliest' => 'womanliest',
      'manliness' => 'womanliness',
      'manly' => 'womanly',
      'masculine' => 'feminine',
      'masculinity' => 'femininity',
      'men' => 'women',
      'mr' => 'ms',
      'mr.' => 'ms.',
      'nobleman' => 'noblewoman',
      'patriarch' => 'matriarch',
      'prince' => 'princess',
      'princes' => 'princesses',
      'waitress' => 'waiter',
      'waitressed' => 'waited'
    }
  end
end

if defined?(Rails)
  class String; include Genderizr::StringMethods; end
end
