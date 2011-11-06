module ApplicationHelper

  def javascript(*files)
    content_for(:js) { javascript_include_tag(*files) }
  end

  def title(object, show_title=true)
    content_for(:title) { content_tag(:h2, object.name) + "\n" } if show_title
    content_for(:head)  { content_tag(:title, page_title(object)) + "\n" }
    content_for(:head)  { tag(:meta, :name => 'keywords', :content => object.keywords) + "\n" } if object.keywords.present?
    content_for(:head)  { tag(:meta, :name => 'description', :content => object.page_body) + "\n" } if object.page_body.present?
  end

  def page_title(object)
    title = []
    title << object.page_title || object.name
    title << AppConfig.site.name
    title.join(" - ")
  end

  def textilize(text)
    CodeFormatter.new(text).to_html.html_safe unless text.blank?
  end

  def link_to_menu(text, link)
    link_to content_tag("span", text), link, title: text
  end

  def link_categories(categories)
    categories = categories.collect{ |category| link_to(category.name, category_path(category.permalink), rel: "tag") }
    categories.to_sentence.html_safe
  end

  def strip_markdown(text, size=400)
    text = strip_tags(textilize(text))
    text = text[0...text[0..(size-3)].rindex(' ')] + "..." if text.size > size
    simple_format(text)
  end

end
