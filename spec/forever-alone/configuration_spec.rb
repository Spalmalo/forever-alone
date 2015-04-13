require "spec_helper"

describe ForeverAlone do
  describe ".configuration" do

    subject { described_class.configuration }

    context "when custom configuration provided" do
      before do
        described_class.configure do |config|
          config.digest     = Digest::SHA1
          config.timeout    = 300
          config.namespace  = 'custom'
        end
      end

      after do
        described_class.configuration = nil
      end

      it "should have proper digest" do
        expect(subject.digest).to eq Digest::SHA1
      end

      it "should have proper timeout" do
        expect(subject.timeout).to eq 300
      end

      it "should have proper namespace" do
        expect(subject.namespace).to eq 'custom'
      end
    end

    context "when no custom configuration provided" do

      it "should have proper digest" do
        expect(subject.digest).to eq Digest::MD5
      end

      it "should have proper timeout" do
        expect(subject.timeout).to eq 1800
      end

      it "should have proper namespace" do
        expect(subject.namespace).to eq :locks
      end

    end
  end
end