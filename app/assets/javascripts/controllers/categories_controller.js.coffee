App.controller 'CategoriesController', ($scope, Category) ->

  $scope.title = "Categorias"
  $scope.categories = Category.query()
