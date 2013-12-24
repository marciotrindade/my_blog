class AddIdToCategoriesPosts < ActiveRecord::Migration
  def change
    add_column :categories_posts, :id, :primary_key
  end
end
