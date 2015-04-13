describe ForeverAlone do
  describe ".new" do
    subject { described_class.new "message", 300 }

    it { is_expected.to be_a ForeverAlone::Validator }

    it "should have proper message" do
      expect(subject.message).to eq "message"
    end

    it "should have proper timeout" do
      expect(subject.timeout).to eq 300
    end
  end
end