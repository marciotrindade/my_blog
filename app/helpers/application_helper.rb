module ApplicationHelper

  def javascript(*files)
    content_for(:js) { javascript_include_tag(*files) }
  end

  def breadcrumb
    html = link_to_unless_current "Home", root_path
    items = breadcrumbs.insert(0, [:admin, "admin_root_path"])
    items.each do |title, link|
      html << " > "
      html << link_to_unless_current(t(title, scope: :breadcrumbs, default: title.to_s), eval(link.to_s))
    end
    html.html_safe
  end

  def page_title
    text = []
    text << AppConfig.site.name
    text.join(" - ")
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
