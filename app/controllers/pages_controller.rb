class PagesController < ApplicationController

  expose(:page)   { Page.find_by_permalink(params[:id]) }

  def show
  end

  def sitemap
    @page = Page.find_by_permalink('sitemap')
    @pages = Page.sitemap
    @categories = Category.scoped
    @posts = Post.scoped
  end

end
