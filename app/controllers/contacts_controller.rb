class ContactsController < ApplicationController

  def new
    @page    = load_page
    @contact = Contact.new
  end

  # POST
  def create
    @page    = load_page
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice: t("contact.flash.success")
    else
      render :new
    end
  end

  private

  def load_page
    Page.find_by_permalink('contato')
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :body)
  end

end
