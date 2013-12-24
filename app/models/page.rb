# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  body       :text
#  keywords   :string(255)
#  page_title :string(255)
#  page_body  :text
#  created_at :datetime
#  updated_at :datetime
#

class Page < ActiveRecord::Base

  validates_presence_of :name, :body, :keywords, :page_title, :page_body
  validates_uniqueness_of :permalink, :page_title

  before_save :set_permalink

  scope :sitemap, -> { where('permalink not in(?)', %W(home contato)) }
  scope :home,    -> { where(permalink: 'home').first }

  def set_permalink
    self.permalink = name.parameterize
  end

end
