class Category < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name

  has_and_belongs_to_many :posts, conditions: { active:  true }

  default_scope order: :name

  before_save :set_permalink

  def set_permalink
    self.permalink = name.parameterize
  end

end
