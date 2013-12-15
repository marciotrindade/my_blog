class PostsController < ApplicationController

  def index
    @page    = home_page
    @posts   = load_posts
  end

  def show
    @post = load_post.decorate
  end

  def by_date
    @page = home_page
    # @page.page_title = t(:page_title, scope: [:posts_by_date], date: meta_date)
    # @page.page_body  = t(:page_body,  scope: [:posts_by_date], date: meta_date)
  end

  private

  # def meta_date
  #   dates = Post.time_interval(params[:year],params[:month], params[:day]).map(&:to_date)
  #   "#{l(dates.first)} - #{l(dates.last)}"
  # end

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
