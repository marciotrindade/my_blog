require 'spec_helper'

describe Admin::PostsController do

  render_views
  mock_permission

  let(:article) { create(:post) }

  describe "on GET :index" do
    let!(:article) { create(:post) }
    before         { get :index }

    it { should render_template(:index) }
    it { should have_assigned(:posts).with([article]) }
  end

  describe "on GET :new" do
    before { get :new }

    it { should render_template(:new) }
    it { expect(assigns(:post)).to be_a_new(Post) }
  end

  describe "on GET :edit" do
    before { get :edit, id: article.id }

    it { should render_template(:edit) }
    it { should have_assigned(:post).with(article) }
  end

  describe "on POST :create" do
    context "with success" do
      before do
        post :create, post: { name: 'test', body: 'content', keywords: 'lala', page_body: 'page body', active: true }
      end

      it { should set_the_flash[:notice].to('Post was successfully created.') }
      it { should redirect_to(admin_posts_path) }
    end

    context "with error" do
      before do
       post :create, post: { name: '' }
     end

      it { should render_template(:new) }
    end
  end

  describe "on PATCH :update" do
    context "with success" do
      before do
        patch :update, id: article.id, post: { name: 'test', }
      end

      it { should set_the_flash[:notice].to('Post was successfully updated.') }
      it { should redirect_to(admin_posts_path) }
    end

    context "with error" do
      before do
       patch :update, id: article.id, post: { name: '' }
     end

      it { should render_template(:edit) }
    end
  end

  describe "on DELETE :destroy" do
    before { delete :destroy, id: article.id }

    it { expect { article.reload }.to raise_error }
    it { should redirect_to(admin_posts_path) }
  end

end
