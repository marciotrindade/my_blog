@PostController = ($scope, $routeParams, Post) ->

  $scope.post = Post.get(id: $routeParams.id)

@PostController.resolve = {
  data: ($q, Post, $timeout) ->
      d = $q.defer()
      onOK = (res) ->
        $timeout.
        $timeout( ()->
          d.resolve(res)
        , 2000)
      onError = (res) ->
        d.reject()
      Post.get(id: $routeParams.id, onOK, onError)
      d.promise
}

