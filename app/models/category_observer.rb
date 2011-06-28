class CategoryObserver < ActiveRecord::Observer
  observe Category

  def before_save(category)
    category.permalink = category.name.parameterize
  end

end
