describe ForeverAlone::Validator, "#flush_locks" do
  subject { validator.flush_locks }

  let!(:validator) { described_class.new "some message", 10 }

  before do
    allow(ForeverAlone.configuration).to receive(:namespace).and_return("locks")
    validator.remember
  end

  it "should flush locks" do
    subject
    expect(ForeverAlone.redis.keys("locks:*")).to eq []
  end
end