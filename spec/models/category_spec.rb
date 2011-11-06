require 'spec_helper'

describe Category do

  context "validations" do
    subject { create(:category) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
  end

  context "assosiations" do
    it { should have_and_belong_to_many(:posts) }
  end

  it "default scope order by name" do
    category_one = create(:category, name: "Zilda")
    category_two = create(:category, name: "Andre")

    Category.first.should == category_two
    Category.last.should == category_one
  end

  it "default scope order by name" do
    category = create(:category)
    create(:post, categories: [category])
    create(:post)

    category.posts.size == 1
  end

end
