class PostDecorator < ApplicationDecorator
  decorates :post

  def created
    I18n.l(created_at, format: :day)
  end

  def category_links
    labels = categories.collect do |category|
      h.link_to(category.name, h.category_path(category.permalink), class: "ls-tag")
    end
    labels.join(' ').html_safe
  end

  def link_to_comments
    h.link_to(h.pluralize(comments.size, t(:one, scope: :comments), t(:other, scope: :comments)), path)
  end

  def body_formated
    h.textilize(body)
  end

end
