require 'spec_helper'

describe User do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should belong_to(:role) }

  it "should has valid attributes" do
    user = build(:user)
    user.should be_valid
  end

  it "should validate email format" do
    user = build(:user, email: "test")
    user.should_not be_valid
    user.email = "test@test.com"
    user.should be_valid
  end

  it "should check if is an admin" do
    @user = build(:user, :role_id => 1)
    @user.admin?.should be_true
    @user.role_id = 2
    @user.admin?.should be_false
  end

end
