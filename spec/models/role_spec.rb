require 'spec_helper'

describe Role do

  it { should validate_presence_of(:name) }
  it { should have_many(:users) }

  context "with an instance" do
    subject { create(:role) }
    it { should validate_uniqueness_of(:name) }
  end

  it "default scope order by name" do
    Role.scoped.to_sql.should =~ /order by roles.name/i
  end

end
