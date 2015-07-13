describe CategoriesController do

  render_views

  before do
    allow(controller).to receive(:admin?).and_return(false)
  end

  describe "on GET :show" do
    let!(:category) { create(:category, name: "my_category") }
    let!(:post)     { create(:post, categories: [category]) }
    before do
      get :show, id: category.permalink
    end

    it { should render_template(:show) }
    it { should have_assigned(:category).with(category) }
    it { should have_assigned(:posts).with(category.posts) }
  end

end
