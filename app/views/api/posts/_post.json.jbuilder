json.name       post.name
json.path       post.path
json.created_at post.created_at
json.created    I18n.l(post.created_at, format: :day)
json.body       textilize(post.summary)
json.categories post.categories, :name, :permalink
