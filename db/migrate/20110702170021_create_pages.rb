class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :permalink
      t.text :body
      t.string :keywords
      t.string :page_title
      t.text :page_body

      t.timestamps
    end
  end
end
