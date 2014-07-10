@PageController = ($scope, $routeParams, Page) ->

  $scope.page = Page.get(id: $routeParams.id)
