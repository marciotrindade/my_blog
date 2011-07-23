require 'spec_helper'

describe CommentsController do

  render_views

  describe "create new" do
    before(:all) do
      @post = Factory(:post)
    end

    it "should respond with success" do
      post :create, { post_id: @post.id, comment: { name: "my name", email: "myemail@test.com", body: "example" }, format: "js" }

      assigns[:saved].should == :success
      response.should be_success
      response.should render_template(:create)
    end

    it "should respond with fail" do
      Contact.any_instance.stubs(:save).returns(false)
      Contact.any_instance.stubs(:valid?).returns(true)
      Contact.any_instance.stubs(:errors).returns("")
      post :create, { post_id: @post.id, comment: { name: "" }, format: "js" }

      assigns[:saved].should == :error
      response.should be_success
      response.should render_template(:create)
    end
  end

end
