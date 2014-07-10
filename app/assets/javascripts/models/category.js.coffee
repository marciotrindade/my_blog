App.factory "Category", ($resource) ->

  $resource "/api/categories/:id", {id: "@id"}
