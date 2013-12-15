class Contact < ActiveRecord::Base

  validates_presence_of :name, :email, :body
  validates :email, email_format: true
  after_create :send_mail

  def send_mail
    ContactMailer.send_contact(self).deliver
  end

end
