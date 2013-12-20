xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc         url_for(root_url)
    xml.lastmod     l(Time.now, :format => :w3c)
    xml.changefreq  "always"
    xml.priority    1.0
  end

  # posts
  @posts.each do |post|
    xml.url do
      xml.loc         "#{request.base_url}#{post.path}"
      xml.lastmod     l(post.updated_at, :format => :w3c)
      xml.changefreq  "yearly"
      xml.priority    0.8
    end
  end
  
  # categories
  @categories.each do |category|
    xml.url do
      xml.loc         url_for(category_url(category.permalink))
      xml.lastmod     l(category.updated_at, :format => :w3c)
      xml.changefreq  "weekly"
      xml.priority    0.6
    end
  end
  
  # pages
  @pages.each do |page|
    xml.url do
      xml.loc         url_for(page_url(page.permalink))
      xml.lastmod     l(page.updated_at, :format => :w3c)
      xml.changefreq  "yearly"
      xml.priority    0.4
    end
  end

end
