class PostDecorator < ApplicationDecorator
  decorates :post

  def linked_title
    h.link_to(name, path, title: name, class: "pjax")
  end

  def created
    h.l(created_at, :format => :long)
  end

  def category_links
    categories.collect{ |category| h.link_to(category.name, h.category_path(category.permalink), :class => "pjax") }.to_sentence.html_safe
  end

  def link_to_comments
    h.link_to(h.pluralize(comments.size, t(:one, :scope => :comments), t(:other, :scope => :comments)), path, :class => "pjax")
  end

  def body_formated
    h.textilize(body)
  end

end
