require 'spec_helper'

describe Admin::ContactsController do

  render_views
  mock_permission

  let(:contact) { create(:contact) }

  describe "on GET :index" do
    let!(:contact) { create(:contact) }
    before         { get :index }

    it { should render_template(:index) }
    it { should have_assigned(:contacts).with([contact]) }
  end

  describe "on GET :edit" do
    before { get :edit, id: contact.id }

    it { should render_template(:edit) }
    it { should have_assigned(:contact).with(contact) }
  end

  describe "on PATCH :update" do
    context "with success" do
      before do
        patch :update, id: contact.id, contact: { name: 'test', page_title: 'lala', keywords: 'lala' }
      end

      it { should set_the_flash[:notice].to('Contact was successfully updated.') }
      it { should redirect_to(admin_contacts_path) }
    end

    context "with error" do
      before do
       patch :update, id: contact.id, contact: { name: '', page_title: 'lala', keywords: 'lala' }
     end

      it { should render_template(:edit) }
    end
  end

  describe "on DELETE :destroy" do
    before { delete :destroy, id: contact.id }

    it { expect { contact.reload }.to raise_error }
    it { should redirect_to(admin_contacts_path) }
  end

end
