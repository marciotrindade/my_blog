require 'spec_helper'

describe Contact do

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:body) }

    context "email format" do
      subject { build(:contact, email: "test") }

      it "should not be valid" do
        expect(subject).to_not be_valid
      end

      it "should be valid" do
        subject.email = "test@test.com"
        expect(subject).to be_valid
      end
    end
  end
end
