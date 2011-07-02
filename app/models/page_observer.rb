class PageObserver < ActiveRecord::Observer
  observe Page

  def before_save(page)
    page.permalink = page.name.parameterize
  end

end
