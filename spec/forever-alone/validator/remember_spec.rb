describe ForeverAlone::Validator, "#remember" do
  subject { validator.remember }

  let!(:validator) { described_class.new "some message", 10 }

  before do
    allow(validator).to receive(:key).and_return "locks:awesome"
  end

  it "should create new Redis record" do
    subject
    expect(ForeverAlone.redis.get("locks:awesome")).to eq "foo"
  end
end