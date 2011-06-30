require 'spec_helper'

describe Category do

  context "validations" do
    subject { Factory(:category) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
  end

  context "assosiations" do
    it { should have_and_belong_to_many(:posts) }
  end

  it "default scope order by name" do
    category_one = Factory(:category, :name => "Zilda")
    category_two = Factory(:category, :name => "Andre")

    Category.first.should == category_two
    Category.last.should == category_one
  end

  it "default scope order by name" do
    category = Factory(:category)
    Factory(:post, :categories => [category])
    Factory(:post)

    category.posts.size == 1
  end

end
