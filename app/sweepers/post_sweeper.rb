class PostSweeper < ActionController::Caching::Sweeper

  observe Post

  def after_save(post)
    expire_cache_for(post)
  end

  private
  def expire_cache_for(post)
    # Expire the fragments
    expire_fragment(:categories)
    expire_fragment(:archives)
  end

end
