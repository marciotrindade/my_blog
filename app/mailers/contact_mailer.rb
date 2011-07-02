class ContactMailer < ActionMailer::Base

  def send_contact(contact)
    @contact = contact
    mail(to: AppConfig.site.email, from: contact.email)
  end

end
