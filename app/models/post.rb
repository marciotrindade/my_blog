# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  permalink      :string(255)
#  summary        :text
#  body           :text
#  comments_count :integer          default(0)
#  keywords       :string(255)
#  page_body      :text
#  created_at     :datetime
#  updated_at     :datetime
#  active         :boolean          default(FALSE)
#

class Post < ActiveRecord::Base

  validates_presence_of :name, :body, :keywords, :page_body
  validates_uniqueness_of :permalink

  has_many :categories_posts, dependent: :destroy
  has_many :categories, through: :categories_posts

  before_save :set_permalink

  default_scope   -> { order('created_at DESC') }
  scope :active,  -> { where(active: true) }
  scope :archive, -> { active.select("date_trunc('month', created_at) + interval '1 day' AS created_at, COUNT(id) AS total").group(1) }
  scope :by_date, -> (year, month=nil, day=nil) { where("created_at BETWEEN ? AND ?", *time_interval(year, month, day)) }

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

  private

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

  def set_permalink
    self.permalink = name.parameterize
  end

end
