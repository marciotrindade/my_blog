class Comment < ActiveRecord::Base

  include Gravtastic
  gravtastic :default => "mm"

  belongs_to :post

  validates_presence_of :name, :body, :post_id
  validates :email, :email_format => true, :allow_blank => true

  scope :unapproved, where(:approved => false)
  scope :approved, where(:approved => true)

  default_scope order(:created_at)

end
