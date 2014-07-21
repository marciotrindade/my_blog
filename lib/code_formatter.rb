class CodeFormatter
  def initialize(text)
    @text = text
  end

  def to_html
    text = @text.clone
    codes = []
    text.gsub!(/^``` ?(.*?)\r?\n(.+?)\r?\n```\r?$/m) do |match|
      code = { id: "CODE#{codes.size}ENDCODE", name: ($1.empty? ? nil : $1), content: $2 }
      codes << code
      "\n\n#{code[:id]}\n\n"
    end
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
    html = markdown.render(text)
    codes.each do |code|
      html.sub!("<p>#{code[:id]}</p>") do
        <<-EOS
          <div class="code_block">
            <div class="code_header">
              #{CGI.escapeHTML(code[:name].to_s)}
            </div>
            #{CodeRay.scan(code[:content], language(code[:name])).div(css: :class)}
          </div>
        EOS
      end
    end
    html
  end

  def language(path)
    case path
    when /\.yml$/ then "yaml"
    when /\.js$/ then "java_script"
    when /\.scss$/ then "css"
    when /\.erb$/, /\.html$/ then "rhtml"
    when /\.h$/, /\.m$/ then "c"
    when /\.rb$/, /\.rake$/, /\.gemspec/, /\.Gemfile/, /\.Guardfile/, /\.rspec/ then "ruby"
    when /\.ctp$/, /\.php$/ then "php"
    when /\./ then path[/\.([^.]+?)$/, 1]
    else :txt
    end
  end
end
