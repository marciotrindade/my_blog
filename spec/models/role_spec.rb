# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Role do

  it { should validate_presence_of(:name) }
  it { should have_many(:users) }

  context "with an instance" do
    before { create(:role) }
    it { should validate_uniqueness_of(:name) }
  end

  it "default scope order by name" do
    expect(Role.all.to_sql).to match(/ORDER BY roles.name/)
  end

end
