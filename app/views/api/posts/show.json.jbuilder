json.name       @post.name
json.path       @post.path
json.created_at @post.created_at
json.created    @post.created
json.body       @post.body_formated
json.categories @post.categories, :name, :permalink
