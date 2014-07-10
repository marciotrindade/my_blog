#= require jquery_ujs
#= require angular
#= require angular-resource
#= require angular-route
#= require angular-sanitize
#= require_self
#= require_tree .
#= require_tree ./controllers
#= require_tree ./models

@App = angular.module 'Application', ['ngRoute', 'ngResource', 'ngSanitize']
