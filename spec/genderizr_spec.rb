require 'spec_helper'

describe Genderizr do

  before :all do
    MASCULINE = "king"
    FEMININE  = "queen"
  end

  context "module methods" do

    it "handles a blank string" do
      subject.feminize("").should eq ""
      subject.masculize("").should eq ""
    end

    it "handles a nil argument" do
      subject.feminize(nil).should eq ""
      subject.masculize(nil).should eq ""
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

    it "preserves whitespace" do
      subject.feminize(" #{MASCULINE}").should  eq " #{FEMININE}"
      subject.feminize("  #{MASCULINE}").should eq "  #{FEMININE}"
      subject.feminize("\t#{MASCULINE}").should eq "	#{FEMININE}"
    end

    it "deals with multi-word strings" do
      subject.feminize("#{MASCULINE} #{MASCULINE} #{FEMININE}").should eq "#{FEMININE} #{FEMININE} #{FEMININE}"
    end

    it "should not add methods to String by default" do
      FEMININE.respond_to?(:feminize).should be false
      FEMININE.respond_to?(:genderize).should be false
      FEMININE.respond_to?(:masculize).should be false
    end

  end

  context "String methods" do

    before :all do
      require 'genderizr/rails'
    end

    it "behave the same" do
      FEMININE.feminize.should          eq subject.feminize(FEMININE)
      FEMININE.genderize(false).should  eq subject.genderize(FEMININE,false)
      FEMININE.genderize(true).should   eq subject.genderize(FEMININE,true)
      FEMININE.masculize.should         eq subject.masculize(FEMININE)

      MASCULINE.feminize.should         eq subject.feminize(MASCULINE)
      MASCULINE.genderize(true).should  eq subject.genderize(MASCULINE,true)
      MASCULINE.genderize(false).should eq subject.genderize(MASCULINE,false)
      MASCULINE.masculize.should        eq subject.masculize(MASCULINE)
    end

  end

end
