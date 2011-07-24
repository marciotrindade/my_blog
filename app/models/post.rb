class Post < ActiveRecord::Base

  validates_presence_of :name, :body, :keywords, :page_body
  validates_uniqueness_of :permalink

  has_and_belongs_to_many :categories
  has_many :comments, order: 'created_at ASC', dependent: :destroy

  before_save :set_permalink

  default_scope order: 'created_at DESC'

  scope :active, where(active: true)
  scope :recent, limit(10)
  scope :dates, select("created_at").group("YEAR(created_at), MONTH(created_at)")
  scope :by_date, lambda { |year, month=nil, day=nil| where("created_at BETWEEN ? AND ?", *time_interval(year, month, day)) }

  def set_permalink
    self.permalink = name.parameterize
  end

  def self.time_interval(year, month = nil, day = nil)
    from = Time.new(year, month || 1, day || 1)
    to = if month.blank? && day.blank?
      from.end_of_year
    elsif day.blank?
      from.end_of_month
    else
      from.end_of_day
    end
    return [from, to]
  end

  def total_in_month
    Post.active.by_date(created_at.year, created_at.month).size
  end

  def summary
    (super.present?) ? super : body
  end

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

  def page_title
    name
  end

end
