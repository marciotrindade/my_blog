App.factory "Page", ($resource) ->

  $resource "/api/pages/:id", {id: "@id"}
