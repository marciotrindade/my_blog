module Api
  class PagesController < BaseController

    def show
      @page = Page.find_by_permalink(params[:id])
    end

  end
end
