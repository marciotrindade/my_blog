class PostsController < ApplicationController
  def index
    @page = Page.home
    @posts = load_posts.includes(:categories)
    fresh_when(etag: @page, last_modified: last_update, public: true)
  end

  def show
    @post = load_post
    fresh_when(etag: @post, last_modified: @post.updated_at, public: true)
  end

  def by_date
    @page = page_for_date
    @posts = Post.by_date(params[:year],params[:month], params[:day]).page(params[:page])
    fresh_when(etag: ['archive', last_update], last_modified: last_update, public: true)
  end

  private

  def page_for_date
    Page.new.tap do |p|
      p.name = date_for_meta_tag
      p.page_title = date_for_meta_tag
      p.page_body = t(:description, scope: %w(posts by_date), date: date_for_meta_tag)
    end
  end

  def date_for_meta_tag
    @date_for_meta_tag ||= begin
      year   = params[:year].to_i
      month  = params[:month].present? ? params[:month].to_i : 1
      date   = Date.new(year, month)
      format = params[:month] ? :month : :year
      l(date, format: format)
    end
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
end
