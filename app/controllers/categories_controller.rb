class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_permalink(params[:id])
    @posts    = @category.posts.page(params[:page])
  end

end
