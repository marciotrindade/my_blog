require 'spec_helper'

describe Category do

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:page_title) }
    it { should validate_presence_of(:keywords) }

    context "uniqueness" do
      before { create(:category) }
      it { should validate_uniqueness_of(:name) }
    end
  end

  describe "assosiations" do
    it { should have_and_belong_to_many(:posts) }
  end

  describe "scopes" do
    it "default order by name" do
      expect(Category.all.to_sql).to match(/ORDER BY name ASC/)
    end
  end
end
