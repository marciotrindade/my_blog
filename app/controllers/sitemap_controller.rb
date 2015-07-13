class SitemapController < ApplicationController
  def index
    @page = Page.find_by_permalink('sitemap')
    @pages = Page.sitemap
    @categories = Category.all
    @posts = Post.all
  end
end
