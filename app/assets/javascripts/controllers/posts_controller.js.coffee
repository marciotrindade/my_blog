App.controller 'PostsController', ($scope, $routeParams, Post) ->

  $scope.posts = Post.query(year: $routeParams.year, month: $routeParams.month, day: $routeParams.day)
