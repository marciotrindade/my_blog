atom_feed do |feed|
  feed.title('comments of marciotrindade.com')
  feed.updated(comments.first.created_at)
  
  comments.each do |comment|
    feed.entry(comment, {:url => "#{request.base_url}#{comment.post.path}"}) do |entry|
      entry.title(comment.name)
      entry.content(comment.body, :type=>'html')
      entry.author{|author| author.name{comment.name}}
    end
  end
end
