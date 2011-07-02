class ContactsController < InheritedResources::Base

  actions :new, :create

  def create
    create!(notice:  t('contact_mailer.send_contact.sucess')) { new_contact_path }
  end

end
