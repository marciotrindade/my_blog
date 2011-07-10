class ContactsController < InheritedResources::Base

  expose(:page) { Page.find_by_permalink('contato') }
  actions :new, :create

  def create
    create!(notice:  t('contact_mailer.send_contact.sucess')) { new_contact_path }
  end

end
