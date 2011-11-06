require 'spec_helper'

describe Contact do

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:body) }
    it "should validate email format" do
      contact = build(:contact, email: "test")
      contact.should_not be_valid
      contact.email = "test@test.com"
      contact.should be_valid
    end
  end

end
