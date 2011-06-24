class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :url
      t.string :email
      t.text :body
      t.references :post
      t.boolean :approved, :default => false

      t.timestamps
    end
    add_index :comments, :post_id
    add_index :comments, :approved
  end
end
