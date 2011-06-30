class PostsController < ApplicationController

  expose(:recent) { Post.active.recent }
  expose(:post)   { Post.active.find_by_permalink(params[:id]) }
  expose(:posts)  { Post.active.by_date(params[:year], params[:month], params[:day]) }

  def index
  end

  def show
    @comment = Comment.new
  end

  def by_date
  end

end
