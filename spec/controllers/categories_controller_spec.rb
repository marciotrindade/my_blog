require 'spec_helper'

describe CategoriesController do

  render_views

  before(:each) do
    controller.stub(:user_signed_in?).and_return(false)
  end

  describe "visit a category" do
    it "should respond to html" do
      category = create(:category, name: "my_category")
      create(:post, categories: [category])
      get :show, id: "my_category"
      response.should be_success
      response.should render_template(:show)
    end
  end

end
