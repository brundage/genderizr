require 'spec_helper'

describe Genderizr do

  it_behaves_like 'a genderized module'
  it_behaves_like 'genderizr form changer'

  it "doesn't add methods to String by default" do
    FEMININE.should_not respond_to(:feminize)
    FEMININE.should_not respond_to(:genderize)
    FEMININE.should_not respond_to(:masculize)
  end

end
