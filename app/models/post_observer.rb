class PostObserver < ActiveRecord::Observer
  observe Post

  def before_save(post)
    post.permalink = post.name.parameterize
  end

end
