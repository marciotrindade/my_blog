class CategoriesController < ApplicationController
  def show
    @category = Category.find_by_permalink(params[:id])
    @posts = @category.posts.page(params[:page])
    fresh_when(etag: @category, last_modified: last_update, public: true)
  end
end
