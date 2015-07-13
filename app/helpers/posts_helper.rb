module PostsHelper
  def category_links(categories)
    categories.map do |category|
      link_to(category.name, category_path(category.permalink), class: "ls-tag")
    end
    .join(' ')
    .html_safe
  end
end
