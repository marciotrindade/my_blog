require 'spec_helper'

describe Comment do

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:post_id) }
    
    it "should validate email format" do
      comment = Factory.build(:comment, email: "test")
      comment.should_not be_valid
      comment.email = "test@test.com"
      comment.should be_valid
    end
  end

  context "assosiations" do
    it { should belong_to(:post) }
  end

  it "default scope order by created_at" do
    comment_one = Factory(:comment, created_at: Date.today)
    comment_two = Factory(:comment, created_at: Date.today - 1.day)

    Comment.first.should == comment_two
    Comment.last.should == comment_one
  end

  it "should has gravatar" do
    comment = Factory(:comment)
    comment.gravatar_url.should_not be_nil
  end

end
