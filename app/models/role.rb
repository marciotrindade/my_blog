# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Role < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :users

  default_scope -> { order("roles.name") }

end
