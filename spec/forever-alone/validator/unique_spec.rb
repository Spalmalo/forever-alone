describe ForeverAlone::Validator, "#unique?" do
  subject { validator.unique? }

  let!(:validator) { described_class.new "some message", 10 }

  context "when message is unique for a given period" do
    it { is_expected.to eq true }
  end

  context "when message is not unique for a given period" do
    before { validator.remember }

    it { is_expected.to eq false }
  end
end