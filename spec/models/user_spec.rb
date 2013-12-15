require 'spec_helper'

describe User do

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should belong_to(:role) }

    describe "email_format" do
      context "when emai is valid" do
        subject { build(:user, email: "test@test.com") }

        it "returns true" do
          expect(subject).to be_valid
        end
      end

      context "when emai is valid" do
        subject { build(:user, email: "test") }

        it "returns false" do
          expect(subject).to_not be_valid
        end
      end
    end
  end

  describe "#admin?" do
    context "when role is 1" do
      subject { build(:user, role_id: 1) }
      it "returns true" do
        expect(subject).to be_admin
      end
    end

    context "when role is 2" do
      subject { build(:user, role_id: 2) }
      it "returns flase" do
        expect(subject).to_not be_admin
      end
    end
  end

end
