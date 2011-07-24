class UpdateUsers < ActiveRecord::Migration
  def up
    add_column :users, :url, :string
    remove_column :users, :username
  end

  def down
    remove_column :users, :url
    add_column :users, :username, :string

    add_index :users, :username, :unique => true
  end
end
