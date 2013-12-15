require 'spec_helper'

describe PostsController do

  render_views

  describe "on GET :index" do
    let!(:page) { create(:page, name: "Home")}
    let!(:post) { create(:post) }
    before      { get :index }

    it { should render_template(:index) }
    it { should have_assigned(:page).with(page) }
    it { should have_assigned(:posts).with([post]) }
  end

  describe "on GET :show" do
    let!(:post) { create(:post) }
    before      { get :show, id: post.permalink }

    it { should render_template(:show) }
    it { should have_assigned(:post).with(post) }
  end

  describe "on GET :by_date" do
    let!(:page) { create(:page, name: "Home")}
    let!(:post) { create(:post) }
    before      { get :by_date, year: post.created_at.year }

    it { should render_template(:by_date) }
    it { should have_assigned(:page).with(page) }
    it { should have_assigned(:posts).with([post]) }
  end

end
