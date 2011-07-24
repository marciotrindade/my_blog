require 'spec_helper'

describe Comment do

  context "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:post_id) }
    it { should validate_presence_of(:user_id) }
  end

  context "assosiations" do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
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
