class CategoriesController < ApplicationController

  def show
    @category = Category.find_by_permalink(params[:id])
  end

end
