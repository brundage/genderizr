# encoding: utf-8
module Genderizr
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
        'mister' => 'miss',  # Careful here going from feminine to masculine
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
end
