module ApplicationHelper

  def javascript(*files)
    content_for(:js) { javascript_include_tag(*files) }
  end

  def title(title)
    content_for(:title) { title.to_s }
  end

  def page_title
    text = []
    text << AppConfig.site.name
    text.join(" - ")
  end

  def breadcrumb
    html = link_to_unless_current "Home", root_path
    breadcrumbs.each do |title, link|
      html << " > "
      html << link_to_unless_current(t(title, :scope => :breadcrumbs, :default => title.to_s), eval(link.to_s))
    end
    html.html_safe
  end

  def show_attribute(name, value, extra='')
    return "" if value.blank?
    value = t("_#{value}") if value.is_a?(TrueClass) || value.is_a?(FalseClass)
    "<dd>#{t(name, :scope => :attributes)}: <span>#{value} #{extra}</span></dd>".html_safe
  end

end
