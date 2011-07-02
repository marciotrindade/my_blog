class CommentsController < ApplicationController

  expose(:post) { Post.find(params[:post_id]) }

  def create
    @comment = Comment.new(params[:comment].merge(post_id: post.id))
    if @comment.save
      @saved = :success
    else
      @saved = :error
    end
  end

end
