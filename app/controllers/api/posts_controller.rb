module Api
  class PostsController < BaseController

    def index
      @posts = load_posts.decorate
    end

    def show
      @post = load_post.decorate
    end

    def archive
      @posts = Post.archive
    end

    private

    def load_posts
      posts = Post.page(params[:page])
      posts = posts.active unless admin?
      posts
    end

    def load_post
      post = Post.where(permalink: params[:id])
      post = post.active unless admin?
      post.first!
    end

    def admin?
      user_signed_in? && current_user.admin?
    end

  end
end
