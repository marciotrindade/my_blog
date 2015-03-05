describe PagesController do

  render_views

  describe "on GET :show" do
    let!(:page) { create(:page) }
    before do
      get :show, id: page.permalink
    end

    it { should render_template(:show) }
    it { should have_assigned(:page).with(page) }
  end

end
