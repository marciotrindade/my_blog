# == Schema Information
#
# Table name: categories_posts
#
#  category_id :integer
#  post_id     :integer
#  id          :integer          not null, primary key
#

class CategoriesPost < ActiveRecord::Base
  belongs_to :post
  belongs_to :category, counter_cache: "posts_count"
end
