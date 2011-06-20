class ContactObserver < ActiveRecord::Observer
  observe Contact

  def after_create(contact)
    ContactMailer.send_contact(contact).deliver
  end

end
