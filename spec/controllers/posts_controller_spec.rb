require 'spec_helper'

describe PostsController do

  render_views

  describe "on GET :index" do
    let!(:page) { create(:page, name: "Home")}
    let!(:post) { create(:post) }
    before      { get :index }

    it { should render_template(:index) }
    it { should have_assigned(:page).with(page) }
    it { should have_assigned(:recents).with([post]) }
  end

end
