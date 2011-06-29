class CategoriesController < ApplicationController

  expose(:category) { Category.find_by_permalink(params[:id]) }

  def show
  end

end