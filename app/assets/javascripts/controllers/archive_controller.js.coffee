App.controller 'ArchiveController', ($scope, Post) ->

  $scope.title = "Arquivo"
  $scope.posts = Post.archive()
