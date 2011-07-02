class PagesController < ApplicationController

  expose(:page)   { Page.find_by_permalink(params[:id]) }

  def show
  end

end
