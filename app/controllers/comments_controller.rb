class CommentsController < ApplicationController

  expose(:post) { Post.find(params[:post_id]) }
  expose(:comments) { Comment.all }

  def index
  end

  def create
    @comment = Comment.new(params[:comment].merge(post_id: post.id, user_id: current_user.id))
    if @comment.save
      @saved = :success
    else
      @saved = :error
    end
  end

end
