class PostsController < ApplicationController

  expose(:recent) { Post.recent }
  expose(:post)   { Post.find_by_permalink(params[:id]) }
  expose(:posts)  { Post.by_date(params[:year], params[:month], params[:day]) }

  def index
  end

  def show
    @comment = Comment.new
  end

  def by_date
  end

end
