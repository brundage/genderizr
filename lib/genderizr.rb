# encoding: utf-8
require 'strscan'

module Genderizr

  VERSION = "0.0.7"

  def self.monkey_patch(mod)
    mod.send(:include, Genderizr::InstanceMethods)
    mod.send(:extend, Genderizr::Forms)
  end


  module Changers

    def feminize(string)
      genderize(string, true)
    end


    def genderize(string,turn_feminine)
      return "" if string.nil?
      lookup = turn_feminine ? masculine_to_feminine : feminine_to_masculine
      result = ""
      s = StringScanner.new(string)
      until s.eos? do
        word = s.scan(/\w+\W?|\W+/)
        result << (lookup[word].nil? ? word : lookup[word])
      end
      result
    end


    def masculize(string)
      genderize(string, false)
    end

  end
  extend Genderizr::Changers


  module Forms

    def m2f_forms
      @m2f_forms ||= masculine_to_feminine
    end


    def m2f_forms=(hash)
      @f2m_forms = hash.invert
      @m2f_forms = hash
    end

  private

    def feminine_to_masculine
      @f2m_forms ||= m2f_forms.invert
    end


    def default_m2f_forms
      {
        '♂' => '♀',
        '⚨' => '♀',
        '⚩' => '♀',
        '⚣' => '⚢',
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
        'waited' => 'waitressed',
        'waiter' => 'waitress'
      }
    end


    def masculine_to_feminine
      @m2f_forms ||= default_m2f_forms
    end

  end
  extend Genderizr::Forms


  module InstanceMethods
    def feminize; Genderizr.feminize(self); end
    def genderize(turn_feminine); Genderizr.genderize(self,turn_feminine); end
    def masculize; Genderizr.masculize(self); end
  end

end

if defined?(Rails)
  Genderizr.monkey_patch(String)
end
