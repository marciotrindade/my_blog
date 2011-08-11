class Admin::PostsController < Admin::BaseController

  add_breadcrumb :post, "collection_path"
  add_breadcrumb :create, '', only: [:new, :create]
  add_breadcrumb :edit, '', only: [:edit, :update]
  add_breadcrumb :show, '', only: [:show]

  actions :all, except: :show

  cache_sweeper :post_sweeper

end