class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :permalink
      t.text :summary
      t.text :body
      t.integer :comments_count, :default => 0
      t.string :keywords
      t.string :page_title
      t.text :page_body

      t.timestamps
    end
    add_index :posts, :permalink
    add_index :posts, :created_at
  end
end
