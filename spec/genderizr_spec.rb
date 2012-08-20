$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'genderizr'

MASCULINE = "king"
FEMININE  = "queen"

describe Genderizr do

  it "doesn't add methods to String by default" do
    FEMININE.should_not respond_to(:feminize)
    FEMININE.should_not respond_to(:genderize)
    FEMININE.should_not respond_to(:masculize)
  end

  it "handles a blank string" do
    subject.feminize("").should eq ""
    subject.masculize("").should eq ""
  end

  it "handles a nil argument" do
    subject.feminize(nil).should eq nil
    subject.masculize(nil).should eq nil
  end

  it "switches genders of a masculine string when requested" do
    subject.genderize(MASCULINE,true).should eq FEMININE
  end

  it "doesn't switch genders of a masculine string when requested" do
    subject.genderize(MASCULINE,false).should eq MASCULINE
  end

  it "switches genders of a feminine string when requested" do
    subject.genderize(FEMININE,false).should eq MASCULINE
  end

  it "doesn't switch genders of a feminine string when requested" do
    subject.genderize(FEMININE,true).should eq FEMININE
  end

  it "does the same thing with the explicit and generic method calls" do
    subject.feminize(MASCULINE).should eq subject.genderize(MASCULINE,true)
    subject.feminize(FEMININE).should eq subject.genderize(FEMININE,true)
    subject.masculize(MASCULINE).should eq subject.genderize(MASCULINE,false)
    subject.masculize(FEMININE).should eq subject.genderize(FEMININE,false)
  end

  it "ignores punctuation" do
    subject.feminize("#{MASCULINE}.").should  eq "#{FEMININE}."
    subject.feminize("#{MASCULINE}-").should  eq "#{FEMININE}-"
    subject.feminize("!#{MASCULINE}-").should eq "!#{FEMININE}-"
  end

  it "doesn't ignore punctuation in 'mr.' and 'ms.'" do
    mr = 'mr.';  ms = 'ms.'
    subject.feminize(mr).should eq ms
    subject.masculize(ms).should eq mr
  end

  it "preserves whitespace" do
    subject.feminize(" #{MASCULINE}").should  eq " #{FEMININE}"
    subject.feminize("  #{MASCULINE}").should eq "  #{FEMININE}"
    subject.feminize("\t#{MASCULINE}").should eq "	#{FEMININE}"
  end

  it "preserves capitalization" do
    subject.feminize(MASCULINE.capitalize).should eq FEMININE.capitalize
  end

  it "preserves upcase" do
    subject.feminize(MASCULINE.upcase).should eq FEMININE.upcase
    subject.feminize(MASCULINE.upcase + " blark").should eq "#{FEMININE.upcase} blark"
  end

  it "deals with multi-word strings" do
    subject.feminize("#{MASCULINE} #{MASCULINE} #{FEMININE}").should eq "#{FEMININE} #{FEMININE} #{FEMININE}"
  end

  it "doesn't change the gender of words with in words" do
    words_within_words = "#{MASCULINE}ified}"
    subject.feminize(words_within_words).should eq words_within_words
  end

  it "allows you to change the masculine to feminine forms" do
    forms = { "han" => "leia" }
    subject.m2f_forms = forms
    subject.m2f_forms.should eq forms
  end

end

describe String do

  before :all do
    Genderizr.monkey_patch(String)
  end

  it "behaves the same" do
    FEMININE.feminize.should eq         Genderizr.feminize(FEMININE)
    FEMININE.genderize(false).should eq Genderizr.genderize(FEMININE,false)
    FEMININE.genderize(true).should eq  Genderizr.genderize(FEMININE,true)
    FEMININE.masculize.should eq        Genderizr.masculize(FEMININE)

    MASCULINE.feminize.should eq         Genderizr.feminize(MASCULINE)
    MASCULINE.genderize(true).should eq  Genderizr.genderize(MASCULINE,true)
    MASCULINE.genderize(false).should eq Genderizr.genderize(MASCULINE,false)
    MASCULINE.masculize.should eq        Genderizr.masculize(MASCULINE)
  end

end
