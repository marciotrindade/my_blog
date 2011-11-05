class Admin::PostsController < Admin::BaseController

  actions :all, except: :show

  cache_sweeper :post_sweeper

end