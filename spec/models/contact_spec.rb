# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

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

  describe "scopes" do
    it "default order by name" do
      expect(Contact.all.to_sql).to match(/ORDER BY created_at DESC/)
    end
  end
end
