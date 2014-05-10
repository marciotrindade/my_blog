require 'spec_helper'

describe Api::CategoriesController do

  render_views

  let!(:category) { create(:category) }

  describe "on GET :index" do
    before { get :index }

    it { should render_template(:index) }
    it { should have_assigned(:categories).with([category]) }
  end

  describe "on GET :show" do
    before { get :show, id: category.permalink }

    it { should render_template(:show) }
    it { should have_assigned(:category).with(category) }
  end
end
