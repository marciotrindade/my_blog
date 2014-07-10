App.controller 'CategoryController', ($scope, $routeParams, Category) ->

  $scope.category = Category.get(id: $routeParams.permalink)
