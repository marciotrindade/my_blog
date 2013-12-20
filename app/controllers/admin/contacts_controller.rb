module Admin
  class ContactsController < Admin::BaseController

    before_action :set_contact, only: [:edit, :update, :destroy]

    # GET /contacts
    def index
      @contacts = Contact.all
    end

    # GET /contacts/1/edit
    def edit
    end

    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        redirect_to admin_contacts_path, notice: 'Contact was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /contacts/1
    def destroy
      @contact.destroy
      redirect_to admin_contacts_path
    end

    private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :body)
    end

  end
end
