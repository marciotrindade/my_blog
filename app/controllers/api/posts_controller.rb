module Api
  class PostsController < BaseController
    def index
      @posts = load_posts
    end

    def show
      @post = load_post
    end

    def archive
      @posts = Post.archive
    end

    private

    def load_posts
      posts = Post.page(params[:page]).includes(:categories)
      posts = posts.active unless admin?
      posts
    end

    def load_post
      post = Post.where(permalink: params[:id])
      post = post.active unless admin?
      post.first!
    end
  end
end
