class Page < ActiveRecord::Base

  validates_presence_of :name, :body, :keywords, :page_title, :page_body
  validates_uniqueness_of :permalink, :page_title

end
