# encoding: utf-8
require 'strscan'

module Genderizr

  VERSION = '0.1.5'

  module StringMethods
    def feminize; Genderizr.feminize(self); end
    def genderize(turn_feminine); Genderizr.genderize(self,turn_feminine); end
    def masculize; Genderizr.masculize(self); end
  end

  extend self

  def feminize(string)
    genderize(string, true)
  end


  def genderize(string,turn_feminine)
    return if string.nil?

    result = ""
    s = StringScanner.new(string)
    lookup = turn_feminine ? masculine_to_feminine : feminine_to_masculine

    until s.eos? do
      word = s.scan(/\w+|\W+/)

      result << word && next if word =~ /^\W+$/  # Short circuit if not a word
      result << word && next if lookup[word.downcase].nil?

      capitalized = (word == word.capitalize)
      upcased     = (word == word.upcase)

      genderized = lookup[word.downcase]
      genderized = genderized.capitalize if capitalized
      genderized = genderized.upcase if upcased
      result << genderized
    end
    result
  end


  def m2f_forms
    @m2f_forms ||= masculine_to_feminine
  end


  def m2f_forms=(hash)
    @f2m_forms = hash.invert
    @m2f_forms = hash
  end


  def masculize(string)
    genderize(string, false)
  end


  def monkey_patch(mod)
    mod.send(:include, Genderizr::StringMethods)
  end


private

  def feminine_to_masculine
    @f2m_forms ||= m2f_forms.invert
  end


  def default_m2f_forms
    {
      '♂' => '♀',
      '⚣' => '⚢',
      'actor' => 'actress',
      'boy' => 'girl',
      'boyish' => 'girlish',
      'boys' => 'girls',
      'brother' => 'sister',
      'brothers' => 'sisters',
      'cowboy' => 'cowgirl',
      'cowboys' => 'cowgirls',
      'craftsman' => 'craftswoman',
      'craftsmen' => 'craftswomen',
      'dad' => 'mom',
      'dads' => 'moms',
      'daddy' => 'mommy',
      'dick' => 'pussy',
      'dicks' => 'pussies',
      'dude' => 'lady',
      'dudes' => 'ladies',
      'ex-wife' => 'ex-husband',
      'ex-wives' => 'ex-husbands',
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
      'males' => 'females',
      'man' => 'woman',
      'manhood' => 'womanhood',
      'manlier' => 'womanlier',
      'manliest' => 'womanliest',
      'manliness' => 'womanliness',
      'manly' => 'womanly',
      'masculine' => 'feminine',
      'masculinity' => 'femininity',
      'masculism' => 'feminism',
      'men' => 'women',
      'mister' => 'miss',  # Careful here going from feminine to masculine
      'mr' => 'ms',
      'mr.' => 'ms.',
      'nobleman' => 'noblewoman',
      'noblemen' => 'noblewomen',
      'patriarch' => 'matriarch',
      'patriarchs' => 'matriarchs',
      'prince' => 'princess',
      'princes' => 'princesses',
      'waited' => 'waitressed',  # Careful here too
      'waiter' => 'waitress',
      'waiters' => 'waitresses'
    }
  end


  def masculine_to_feminine
    @m2f_forms ||= default_m2f_forms
  end

end

if defined?(Rails)
  Genderizr.monkey_patch(String)
end
