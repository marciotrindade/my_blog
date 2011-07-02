require 'spec_helper'

describe Role do

  context "validations" do
    subject { Factory(:role) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
  end

  context "assosiations" do
    it { should have_and_belong_to_many(:users) }
  end

  it "default scope order by name" do
    role_one = Factory(:role, name: "Zilda")
    role_two = Factory(:role, name: "Andre")

    Role.first.should == role_two
    Role.last.should == role_one
  end

end
