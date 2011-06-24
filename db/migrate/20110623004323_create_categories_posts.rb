class CreateCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :categories_posts, :id => false do |t|
      t.references :category
      t.references :post
    end

    add_index :categories_posts, :category_id
    add_index :categories_posts, :post_id
  end
end
