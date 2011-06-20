class Contact < ActiveRecord::Base

  validates_presence_of :name, :email, :body
  validates :email, :email_format => true

end
