class RemovePageTitleToPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :page_title
  end

  def down
    add_column :posts, :page_title, :string
  end
end
