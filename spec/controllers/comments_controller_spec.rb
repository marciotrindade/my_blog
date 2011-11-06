require 'spec_helper'

describe CommentsController do

  render_views

  describe "create new" do

    before do
      @user = build(:user)
      @user.stub(:id).and_return(1)
      controller.stub(:current_user).and_return(@user)
      @post = build(:post)
      @post.stub(:id).and_return(1)
      @post.stub(:to_param).and_return("1")
      Post.stub(:find).and_return(@post)
    end

    it "should respond with success" do
      Comment.any_instance.stub(:save).and_return(true)
      post :create, { post_id: @post, comment: { body: "example" }, format: "js" }

      assigns[:saved].should == :success
      response.should be_success
      response.should render_template(:create)
    end

    it "should respond with fail" do
      Contact.any_instance.stub(:save).and_return(false)
      post :create, { post_id: @post, comment: { name: "" }, format: "js" }

      assigns[:saved].should == :error
      response.should be_success
      response.should render_template(:create)
    end
  end

end
