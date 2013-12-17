class Category < ActiveRecord::Base

  validates_presence_of   :name, :page_title, :keywords
  validates_uniqueness_of :name

  has_and_belongs_to_many :posts, -> { active }

  default_scope -> { order('name ASC') }

  before_save :set_permalink

  def set_permalink
    self.permalink = name.parameterize
  end

end
