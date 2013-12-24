# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  email                :string(255)      default(""), not null
#  encrypted_password   :string(128)      default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer          default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  url                  :string(255)
#  image_url            :string(255)
#  role_id              :integer
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :validatable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :registerable

  belongs_to :role

  validates_presence_of :name, :email
  validates_presence_of :password, :password_confirmation, :on => :create
  validates :email, email_format: true

  default_scope -> { order(:name) }

  def admin?
    role_id == 1
  end

end
