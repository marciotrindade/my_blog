module ApplicationHelper

  def javascript(*files)
    content_for(:js) { javascript_include_tag(*files) }
  end

  def title(object, show_title=true)
    content_for(:head)  { content_tag(:title, page_title(object)) + "\n" }
    content_for(:head)  { tag(:meta, :name => 'keywords',    :content => object.keywords) + "\n" } if object.keywords.present?
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

  def strip_markdown(text, size=400)
    text = strip_tags(textilize(text))
    text = text[0...text[0..(size-3)].rindex(' ')] + "..." if text.size > size
    simple_format(text)
  end

  def link_to_menu(name, link, matcher, opts={})
    page_name = t(name, scope: %w(layouts application menu))
    opts.reverse_merge!(role: "menuitem", title: page_name)
    opts[:class] ||= ""
    opts[:class]  += " active" if params[:controller].match(matcher)
    link_to(page_name, link, opts)
  end

  def app_pagination(collection, pagination_opts={}, filter_opts={})
    content = ''
    if collection.num_pages > 1
      content = content_tag(:div, class: 'txt-center') do
        paginate(collection, pagination_opts)
      end
    end
    content.html_safe
  end

  def flash_message
    content = ""
    flash.each do |type, message|
      content = content_tag("div", class: "onFocus alert alert-#{t(type, scope: %w(flash type))}") do
        content_tag("a", 'x', class: 'close', data: { dismiss: "alert" }, :'aria-hidden' => 'true') +
        message.html_safe
      end if message.present?
    end
    content.html_safe
  end

end
