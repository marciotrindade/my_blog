# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base

  validates_presence_of :name, :email, :body
  validates :email, email_format: true
  after_create :send_mail

  default_scope -> { order('created_at DESC') }

  def send_mail
    ContactMailer.send_contact(self).deliver_later
  end

end
