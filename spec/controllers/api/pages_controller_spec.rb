require 'spec_helper'

describe Api::PagesController do

  render_views

  let!(:page) { create(:page) }
  before do
    allow(controller).to receive(:admin?).and_return(false)
  end

  describe "on GET :show" do
    before { get :show, id: page.permalink }

    it { should render_template(:show) }
    it { should have_assigned(:page).with(page) }
  end
end
