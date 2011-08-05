require 'spec_helper'

describe PagesController do

  render_views

  before(:each) do
    controller.stub(:user_signed_in?).and_return(true)
    @page = FactoryGirl.build(:page, name: "my page")
    Page.stub(:find_by_permalink).and_return(@page)
  end

  describe "visit a category" do
    it "should respond to html" do
      get :show, id: "my-page"
      response.should be_success
      response.should render_template(:show)
    end
  end

end
