shared_examples 'genderizr form changer' do

  subject { described_class }

  it "allows you to change the masculine to feminine forms" do
    forms = { "han" => "leia" }
    subject.m2f_forms = forms
    subject.m2f_forms.should eq forms
  end

end
