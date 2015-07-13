module Api
  class CategoriesController < BaseController
    def index
      @categories = Category.all
    end

    def show
      @category = Category.find_by_permalink(params[:id])
    end
  end
end
