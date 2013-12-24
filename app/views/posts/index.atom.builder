atom_feed do |feed|
  feed.title('marciotrindade.com')
  feed.updated(Post.first.created_at)

  Post.all.each do |post|
    feed.entry(post, {url: "#{request.base_url}#{post.path}"}) do |entry|
      entry.title(post.name)
      entry.content(textilize(post.body), type: 'html')
      entry.author{|author| author.name{'Marcio Trindade'}}
    end
  end
end
