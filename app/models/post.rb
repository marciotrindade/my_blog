class Post < ActiveRecord::Base

  validates_presence_of :name, :body, :keywords, :page_title, :page_body
  validates_uniqueness_of :permalink, :page_title

  default_scope :order => 'created_at DESC'

  scope :recent, :limit => 5

  def year_path
    "/#{created_at.year}"
  end
  
  def month_path
    "#{year_path}/#{created_at.month}"
  end

  def day_path
    "#{month_path}/#{created_at.day}"
  end

  def path
    "#{day_path}/#{permalink}"
  end

end
