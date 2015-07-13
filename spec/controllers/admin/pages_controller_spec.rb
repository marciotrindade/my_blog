describe Admin::PagesController do

  render_views
  mock_permission

  let(:page) { create(:page) }

  describe "on GET :index" do
    let!(:page) { create(:page) }
    before      { get :index }

    it { should render_template(:index) }
    it { should have_assigned(:pages).with([page]) }
  end

  describe "on GET :new" do
    before { get :new }

    it { should render_template(:new) }
    it { expect(assigns(:page)).to be_a_new(Page) }
  end

  describe "on GET :edit" do
    before { get :edit, id: page.id }

    it { should render_template(:edit) }
    it { should have_assigned(:page).with(page) }
  end

  describe "on POST :create" do
    context "with success" do
      before do
        post :create, page: { name: 'test', body: 'lala', keywords: 'lala', page_title: 'page title', page_body: 'page body' }
      end

      it { should set_flash[:notice].to('Page was successfully created.') }
      it { should redirect_to(admin_pages_path) }
    end

    context "with error" do
      before do
       post :create, page: { name: '' }
     end

      it { should render_template(:new) }
    end
  end

  describe "on PATCH :update" do
    context "with success" do
      before do
        patch :update, id: page.id, page: { name: 'test' }
      end

      it { should set_flash[:notice].to('Page was successfully updated.') }
      it { should redirect_to(admin_pages_path) }
    end

    context "with error" do
      before do
       patch :update, id: page.id, page: { name: '' }
     end

      it { should render_template(:edit) }
    end
  end

  describe "on DELETE :destroy" do
    let!(:page) { create(:page) }

    it 'redirects to index page' do
      delete :destroy, { id: page.id }

      should redirect_to(admin_pages_path)
    end

    it 'removes the page' do
      expect {
        delete :destroy, { id: page.id }
      }.to change(Page, :count).by(-1)
    end
  end
end
