require 'spec_helper'

describe PostObserver do
  it "should generate the permalink when a post is created" do
    post = Factory.build(:post, name: "my name")
    obs = PostObserver.instance
    obs.before_save(post)
    post.permalink.should == "my-name"
  end
end
