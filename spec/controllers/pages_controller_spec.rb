require 'spec_helper'

describe PagesController do

  render_views

  describe "routes" do
    it "should respond to pages routes" do
      { :get => pages_path("anything") }.should route_to(:controller => "pages", :action => "anything")
    end
  end

  describe "respond for any page" do
    it "should render any template" do
      get "about-us"
      response.should be_success
      should render_template(:about_us)
    end
  end

end
