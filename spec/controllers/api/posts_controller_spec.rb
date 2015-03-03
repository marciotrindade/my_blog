describe Api::PostsController do

  render_views

  let!(:post) { create(:post) }
  before do
    allow(controller).to receive(:admin?).and_return(false)
  end

  describe "on GET :index" do
    before { get :index }

    it { should render_template(:index) }
    it { should have_assigned(:posts).with([post]) }
  end

  describe "on GET :show" do
    before { get :show, id: post.permalink }

    it { should render_template(:show) }
    it { should have_assigned(:post).with(post) }
  end

  describe "on GET :archive" do
    before { get :archive }

    it { should render_template(:archive) }
    it { should have_assigned(:posts) }
  end
end
