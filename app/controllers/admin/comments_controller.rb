class Admin::CommentsController < Admin::AdminController

  add_breadcrumb :comments, "collection_path"
  add_breadcrumb :create, '', :only => [:new, :create]
  add_breadcrumb :edit, '', :only => [:edit, :update]
  add_breadcrumb :show, '', :only => [:show]

  actions :all, :except => :show

  private
  def collection
    @collection ||= Comment.approved
  end

end