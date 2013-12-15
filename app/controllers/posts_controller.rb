class PostsController < ApplicationController

  def index
    @page    = home_page
    @posts   = load_posts
  end

  def show
    @post = load_post.decorate
  end

  def by_date
    @page            = home_page
    @page.page_title = t(:title,       scope: %w(posts by_date), date: date_for_meta_tag)
    @page.page_body  = t(:description, scope: %w(posts by_date), date: date_for_meta_tag)
    @posts           = Post.by_date(params[:year],params[:month], params[:day]).page
  end

  private

  def date_for_meta_tag
    year   = params[:year].to_i
    month  = params[:month].present? ? params[:month].to_i : 1
    date   = Date.new(year, month)
    format = params[:month] ? :month : :year
    l(date, format: format)
  end

  def home_page
    Page.where(permalink: 'home').first
  end

  def load_posts
    posts = Post.page(params[:page]).per(10)
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
    # TODO: fix it
    # current_user && current_user.admin?
    true
  end

end
