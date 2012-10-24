$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'genderizr'

describe Genderizr do

  let(:feminine)  { 'queen' }
  let(:masculine) { 'king' }
  let(:mr) { 'mr.' }
  let(:ms) { 'ms.' }

  it "doesn't add methods to String by default" do
    feminine.should_not respond_to(:feminize)
    feminine.should_not respond_to(:genderize)
    feminine.should_not respond_to(:masculize)
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
    subject.genderize(masculine,true).should eq feminine
  end

  it "doesn't switch genders of a masculine string when requested" do
    subject.genderize(masculine,false).should eq masculine
  end

  it "switches genders of a feminine string when requested" do
    subject.genderize(feminine,false).should eq masculine
  end

  it "doesn't switch genders of a feminine string when requested" do
    subject.genderize(feminine,true).should eq feminine
  end

  it "does the same thing with the explicit and generic method calls" do
    subject.feminize(masculine).should eq subject.genderize(masculine,true)
    subject.feminize(feminine).should eq subject.genderize(feminine,true)
    subject.masculize(masculine).should eq subject.genderize(masculine,false)
    subject.masculize(feminine).should eq subject.genderize(feminine,false)
  end

  it "ignores punctuation" do
    subject.feminize("#{masculine}.").should  eq "#{feminine}."
    subject.feminize("#{masculine}-").should  eq "#{feminine}-"
    subject.feminize("!#{masculine}-").should eq "!#{feminine}-"
  end

  it "doesn't ignore punctuation in 'mr.' and 'ms.'" do
    subject.feminize(mr).should eq ms
    subject.masculize(ms).should eq mr
  end

  it "preserves whitespace" do
    subject.feminize(" #{masculine}").should  eq " #{feminine}"
    subject.feminize("  #{masculine}").should eq "  #{feminine}"
    subject.feminize("\t#{masculine}").should eq "	#{feminine}"
  end

  it "preserves capitalization" do
    subject.feminize(masculine.capitalize).should eq feminine.capitalize
  end

  it "preserves upcase" do
    subject.feminize(masculine.upcase).should eq feminine.upcase
    subject.feminize(masculine.upcase + " blark").should eq "#{feminine.upcase} blark"
  end

  it "deals with multi-word strings" do
    subject.feminize("#{masculine} #{masculine} #{feminine}").should eq "#{feminine} #{feminine} #{feminine}"
  end

  it "doesn't change the gender of words with in words" do
    words_within_words = "#{masculine}ified}"
    subject.feminize(words_within_words).should eq words_within_words
  end

  it "allows you to change the masculine to feminine forms" do
    forms = { "han" => "leia" }
    subject.m2f_forms = forms
    subject.m2f_forms.should eq forms
  end


  describe Genderizr::StringMethods do

    before :all do
      Genderizr.monkey_patch(String)
    end

    it "behaves the same" do
      feminine.feminize.should eq         Genderizr.feminize(feminine)
      feminine.genderize(false).should eq Genderizr.genderize(feminine,false)
      feminine.genderize(true).should eq  Genderizr.genderize(feminine,true)
      feminine.masculize.should eq        Genderizr.masculize(feminine)

      masculine.feminize.should eq         Genderizr.feminize(masculine)
      masculine.genderize(true).should eq  Genderizr.genderize(masculine,true)
      masculine.genderize(false).should eq Genderizr.genderize(masculine,false)
      masculine.masculize.should eq        Genderizr.masculize(masculine)
    end

  end
end
