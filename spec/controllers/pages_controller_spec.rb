require 'spec_helper'

describe PagesController do

  render_views

  describe "visit a category" do
    it "should respond to html" do
      page = Factory(:page, name: "my page")
      get :show, id: "my-page"
      response.should be_success
      response.should render_template(:show)
    end
  end

end
