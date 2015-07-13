json.(@category, :name)
json.posts @category.posts, partial: 'api/posts/post', as: :post
