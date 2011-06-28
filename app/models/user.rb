class User < ActiveRecord::Base
  extend ActiveSupport::Memoizable

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :validatable and :timeoutable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :registerable

  has_and_belongs_to_many :roles

  validates_presence_of :name, :email, :username
  validates_presence_of :password, :password_confirmation, :on => :create
  validates :email, :email_format => true

  default_scope order(:name)

  def has_access_to?(role)
    role_names = roles.map { |r| r.name.downcase }
    role_names.include?(role.to_s.downcase)
  end

  memoize :has_access_to?

end
