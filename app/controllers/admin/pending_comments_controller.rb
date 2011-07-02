class Admin::PendingCommentsController < Admin::AdminController

  add_breadcrumb :pedding_comments, "collection_path"
  add_breadcrumb :create, '', only: [:new, :create]
  add_breadcrumb :edit, '', only: [:edit, :update]
  add_breadcrumb :show, '', only: [:show]

  defaults resource_class: Comment, collection_name: 'comments', instance_name: 'comment'

  actions :all, except: :show

  private
  def collection
    @collection ||= Comment.unapproved
  end

end
