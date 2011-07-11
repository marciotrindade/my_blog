# coding: utf-8
module AdminHelper

  def data_table(options={})
    options.reverse_merge! "sPaginationType" => "full_numbers",
                           "bStateSave" => true,
                           "bInfo" => false,
                           "iDisplayLength" => "100",
                           "aaSorting" => [[ 0, "asc"]]
    content_for(:js) do
      javascript_tag do
        "$('.table').dataTable(#{options.to_json});".html_safe
      end
    end
  end

  def admin_title(title)
    content_for(:title) { title.to_s }
  end

  def admin_page_title
    text = ""
    breadcrumbs.each do |title, link|
      text << t(title, scope: :breadcrumbs, default: title.to_s)
      text << " - "
    end
    text << AppConfig.site.name
    text
  end

  def render_or_default(name)
    render name
  rescue ActionView::MissingTemplate
    render partial: "admin/scaffolds/#{name}"
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

end