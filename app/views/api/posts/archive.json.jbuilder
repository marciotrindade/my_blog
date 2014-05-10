json.array! @posts do |post|
  json.label l(post.created_at, format: :archive)
  json.total post.total
  json.path  post.month_path
end
