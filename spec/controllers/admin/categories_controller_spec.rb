describe Admin::CategoriesController do

  render_views
  mock_permission

  let(:category) { create(:category) }

  describe "on GET :index" do
    let!(:category) { create(:category) }
    before          { get :index }

    it { should render_template(:index) }
    it { should have_assigned(:categories).with([category]) }
  end

  describe "on GET :new" do
    before { get :new }

    it { should render_template(:new) }
    it { expect(assigns(:category)).to be_a_new(Category) }
  end

  describe "on GET :edit" do
    before { get :edit, id: category.id }

    it { should render_template(:edit) }
    it { should have_assigned(:category).with(category) }
  end

  describe "on POST :create" do
    context "with success" do
      before do
        post :create, category: { name: 'test', page_title: 'lala', keywords: 'lala' }
      end

      it { should set_the_flash[:notice].to('Category was successfully created.') }
      it { should redirect_to(admin_categories_path) }
    end

    context "with error" do
      before do
       post :create, category: { name: '' }
     end

      it { should render_template(:new) }
    end
  end

  describe "on PATCH :update" do
    context "with success" do
      before do
        patch :update, id: category.id, category: { name: 'test', }
      end

      it { should set_the_flash[:notice].to('Category was successfully updated.') }
      it { should redirect_to(admin_categories_path) }
    end

    context "with error" do
      before do
       patch :update, id: category.id, category: { name: '' }
     end

      it { should render_template(:edit) }
    end
  end

  describe "on DELETE :destroy" do
    before { delete :destroy, id: category.id }

    it { expect { category.reload }.to raise_error }
    it { should redirect_to(admin_categories_path) }
  end

end
