class ContactsController < InheritedResources::Base

  def new
    @page = load_page
  end

  def create
    @page = load_page
    create!(notice:  t('contact_mailer.send_contact.sucess')) { new_contact_path }
  end

  private

  def load_page
    Page.find_by_permalink('contato')
  end

end
