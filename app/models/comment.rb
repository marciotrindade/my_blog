class Comment < ActiveRecord::Base

  include Gravtastic
  gravtastic default: "mm"

  belongs_to :post, counter_cache: true
  belongs_to :user

  validates_presence_of :body, :post_id, :user_id

  scope :unapproved, where(approved: false)
  scope :approved, where(approved: true)

  default_scope order(:created_at)

  def name
    user.present? ? user.name : super
  end

  def email
    user.present? ? user.email : super
  end

  def url
    user.present? ? user.url : super
  end

  def gravatar_url
    user.present? ? user.image_url : super
  end

end
