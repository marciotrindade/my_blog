class AddPostsCountToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :posts_count, :integer, default: 0
  end
end
