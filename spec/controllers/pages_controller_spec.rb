require 'spec_helper'

describe PagesController do

  render_views

  before do
    allow(controller).to receive(:admin?).and_return(false)
  end

  describe "on GET :show" do
    let!(:page) { create(:page) }
    before do
      get :show, id: page.permalink
    end

    it { should render_template(:show) }
    it { should have_assigned(:page).with(page) }
  end

end
