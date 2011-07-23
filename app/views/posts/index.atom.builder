atom_feed do |feed|
  feed.title('marciotrindade.com')
  feed.updated(recent[0].created_at)

  recent.each do |post|
    feed.entry(post, {:url => "#{request.base_url}#{post.path}"}) do |entry|
      entry.title(post.name)
      entry.content(textilize(post.body), :type=>'html')
      entry.author{|author| author.name{'Marcio Trindade'}}
    end
  end
end
