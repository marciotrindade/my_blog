class PostsController < ApplicationController

  expose(:recent) { Post.recent }
  expose(:post) { Post.find_by_permalink(params[:id]) }

  def index
  end

  def show
  end

end
