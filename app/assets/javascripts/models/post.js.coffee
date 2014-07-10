App.factory "Post", ($resource) ->

  $resource "/api/posts/:id", {id: "@id"}, {
    archive: { method:'GET', isArray:true, params: {id: 'archive'} }
  }
