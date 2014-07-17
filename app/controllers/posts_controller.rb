class PostsController < ApplicationController

  def index
    @page    = Page.home
    @posts   = load_posts.includes(:categories)
  end

  def show
    @post = load_post.decorate
  end

  def by_date
    @page            = Page.new
    @page.page_title = @page.name = date_for_meta_tag
    @page.page_body  = t(:description, scope: %w(posts by_date), date: date_for_meta_tag)
    @posts           = Post.by_date(params[:year],params[:month], params[:day]).page(params[:page])
  end

  private

  def date_for_meta_tag
    year   = params[:year].to_i
    month  = params[:month].present? ? params[:month].to_i : 1
    date   = Date.new(year, month)
    format = params[:month] ? :month : :year
    l(date, format: format)
  end

  def load_posts
    posts = Post.page(params[:page])
    posts = posts.active unless admin?
    posts
  end

  def load_post
    post = Post.where(permalink: params[:id])
    post = post.active unless admin?
    post.first
  end

  def method_name
    Post.active.by_date(params[:year], params[:month], params[:day]).decorate
  end

  def admin?
    user_signed_in? && current_user.admin?
  end

end
