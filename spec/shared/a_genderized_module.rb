MASCULINE = "king"
FEMININE  = "queen"

shared_examples 'a genderized module' do

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

  it "deals with multi-word strings" do
    subject.feminize("#{MASCULINE} #{MASCULINE} #{FEMININE}").should eq "#{FEMININE} #{FEMININE} #{FEMININE}"
  end

  it "doesn't change the gender of words with in words" do
    words_within_words = "#{MASCULINE}ified}"
    subject.feminize(words_within_words).should eq words_within_words
  end

end
