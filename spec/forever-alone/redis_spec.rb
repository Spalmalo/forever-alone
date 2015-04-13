describe ForeverAlone do
  describe ".redis" do
    subject { described_class.redis }

    it { is_expected.to be_a Redis }
  end
end