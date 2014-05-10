json.(@category, :name)
json.posts @category.posts.decorate, partial: 'api/posts/post', as: :post
