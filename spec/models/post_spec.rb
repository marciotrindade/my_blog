require 'spec_helper'

describe Post do

  context "validations" do
    subject { Factory(:post, :permalink => "test") }
    it { should validate_uniqueness_of(:permalink) }
    it { should validate_uniqueness_of(:page_title) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:keywords) }
    it { should validate_presence_of(:page_title) }
    it { should validate_presence_of(:page_body) }
  end

  context "assosiations" do
    # it { should have_and_belong_to_many(:category) }
    # it { should have_many(:comments) }
  end

  it "default scope order by name" do
    post_one = Factory(:post, :created_at => Date.today - 1.day)
    post_two = Factory(:post, :created_at => Date.today)

    Post.first.should == post_two
    Post.last.should == post_one
  end

end
