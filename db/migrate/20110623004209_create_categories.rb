class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :permalink
      t.string :keywords
      t.string :page_title
      t.text :page_body

      t.timestamps
    end

    add_index :categories, :permalink
  end
end
