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
        patch :update, id: contact.id, contact: { name: 'test' }
      end

      it { should set_flash[:notice].to('Contact was successfully updated.') }
      it { should redirect_to(admin_contacts_path) }
    end

    context "with error" do
      before do
       patch :update, id: contact.id, contact: { name: '' }
     end

      it { should render_template(:edit) }
    end
  end

  describe "on DELETE :destroy" do
    let!(:contact) { create(:contact) }

    it 'redirects to index page' do
      delete :destroy, { id: contact.id }

      should redirect_to(admin_contacts_path)
    end

    it 'removes the contact' do
      expect {
        delete :destroy, { id: contact.id }
      }.to change(Contact, :count).by(-1)
    end
  end
end
