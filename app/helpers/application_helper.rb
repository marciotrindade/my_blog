module ApplicationHelper

  def javascript(*files)
    content_for(:js) { javascript_include_tag(*files) }
  end

  def title(object, ico=nil)
    @content_title = object.page_title || object.name
    @title_ico = ico
    content_for(:head)  { content_tag(:title, page_title(object)) + "\n" }
    content_for(:head)  { tag(:meta, :name => 'keywords',    :content => object.keywords) + "\n" } if object.keywords.present?
    content_for(:head)  { tag(:meta, :name => 'description', :content => object.page_body) + "\n" } if object.page_body.present?
  end

  def admin_title(title, ico=nil)
    @content_title = title
    @title_ico = ico
  end

  def content_title
    @content_title
  end

  def title_ico
    @title_ico
  end

  def textilize(text)
    CodeFormatter.new(text).to_html.html_safe unless text.blank?
  end

  def strip_markdown(text, size=400)
    text = strip_tags(textilize(text))
    text = text[0...text[0..(size-3)].rindex(' ')] + "..." if text.size > size
    simple_format(text)
  end

  def menu_tag(name, url, matcher, opts={})
    li_opts={}
    li_opts[:class] = 'ls-active' if params[:controller].match(matcher)
    content_tag(:li, li_opts) { link_to name, url, opts }
  end

  def app_pagination(collection, pagination_opts={}, filter_opts={})
    content = ''
    if collection.num_pages > 1
      content = content_tag(:div, class: 'ls-pagination-filter') do
        paginate(collection, pagination_opts)
      end
    end
    content.html_safe
  end

  def flash_message
    content = ""
    flash.each do |type, message|
      content = content_tag("div", class: "ls-alert-#{t("flash.type.#{type}")} ls-dismissable") do
        content_tag("span", "×", class: "ls-dismiss", data: {"ls-module" => "dismiss"})+
        message.html_safe
      end if message.present?
    end
    content.html_safe
  end

  def sub_menu_tag(name, path, opts={})
    li_opts={}
    li_opts[:class] = 'ls-active' if self.current_page?(path)
    content_tag(:li, li_opts) { link_to name, path, opts }
  end

  private

  def page_title(object)
    title = []
    title << object.page_title || object.name
    title << AppConfig.site.name
    title.join(" - ")
  end

end
