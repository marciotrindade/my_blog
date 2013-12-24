# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  email                :string(255)      default(""), not null
#  encrypted_password   :string(128)      default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer          default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  url                  :string(255)
#  image_url            :string(255)
#  role_id              :integer
#

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
