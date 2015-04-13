describe ForeverAlone::Validator, "#ensure" do
  subject { validator.ensure }

  let!(:validator) { described_class.new "some message" }

  before { allow(validator).to receive(:remember) }

  context "when message is unique" do
    before { allow(validator).to receive(:unique?).and_return true }

    it "should raise no error" do
      expect { subject }.not_to raise_error
    end

    it "should remember message" do
      subject
      expect(validator).to have_received(:remember)
    end

  end

  context "when message is not unique" do
    before { allow(validator).to receive(:unique?).and_return false }

    it "should raise ForeverAlone::MessageIsNotUnique error" do
      expect { subject }.to raise_error ForeverAlone::MessageIsNotUnique
    end

  end
end