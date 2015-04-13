describe ForeverAlone::Validator, "#key" do
  subject { validator.key }

  let!(:validator) { described_class.new "some message" }

  context "when digest is Digest::MD5" do
    before { allow(ForeverAlone.configuration).to receive(:digest).and_return Digest::MD5 }

    it { is_expected.to eq "locks:df49b60423903e095b80d9b4a92eb065" }
  end

  context "when digest is Digest::SHA1" do
    before { allow(ForeverAlone.configuration).to receive(:digest).and_return Digest::SHA1 }

    it { is_expected.to eq "locks:af52b1a96761839824b7b4c0e6cea4b09f2b0710" }
  end
end