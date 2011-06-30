class Category < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name

  has_and_belongs_to_many :posts

  default_scope :order => :name

end