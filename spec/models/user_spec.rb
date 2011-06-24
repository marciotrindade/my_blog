require 'spec_helper'

describe User do

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it "should has valid attributes" do
      user = Factory.build(:user)
      user.should be_valid
    end
    it "should validate email format" do
      user = Factory.build(:user, :email => "test")
      user.should_not be_valid
      user.email = "test@test.com"
      user.should be_valid
    end
  end

  context "associations" do
    it { should have_and_belong_to_many(:roles) }
  end

  describe "with permissions" do
    before(:all) do
      @user = Factory(:user)
      @user.roles << Role.create(:name => "admin")
      @user = User.find(@user.id)
    end

    it "should allow access to admin" do
      @user.has_access_to?(:admin).should == true
    end

    it "should deny access to named_scope" do
      @user.has_access_to?(:named_scope).should == false
    end
  end

end
