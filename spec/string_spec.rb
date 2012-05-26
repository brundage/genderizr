require 'spec_helper'

describe String do

  before :all do
    Genderizr.monkey_patch(String)
  end

  it_behaves_like 'genderizr form changer'

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
