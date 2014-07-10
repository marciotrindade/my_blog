App.config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode(true)

  $routeProvider
    .when("/contacts/new",        { templateUrl: "/assets/contacts/new.html" })
    .when("/pages/:id", {
      templateUrl: "/assets/pages/show.html"
      controller: "PageController"
    })
    .when("/categories/:permalink", {
      templateUrl: "/assets/categories/show.html"
      controller: "CategoryController"
    })
    .when("/:year", {
      templateUrl: "/assets/posts/index.html"
      controller: "PostsController"
    })
    .when("/:year/:month", {
      templateUrl: "/assets/posts/index.html"
      controller: "PostsController"
    })
    .when("/:year/:month/:day", {
      templateUrl: "/assets/posts/index.html"
      controller: "PostsController"
    })
    .when("/:year/:month/:day/:id", {
      templateUrl: "/assets/posts/show.html"
      controller: "PostController"
    })
    .when("/", {
      templateUrl: "/assets/posts/index.html"
      controller: "PostsController"
    })
    .otherwise(redirectTo: "/")
