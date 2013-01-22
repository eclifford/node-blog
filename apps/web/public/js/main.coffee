require.config
  paths: 
    'angular': 'vendor/angular'
  shim: 
    'angular': {'exports': 'angular'}
  priority: [
    "angular"
  ]
  urlArgs: 'v=1.1'

require [
  'angular',
  'app'
], (angular, app) ->
  angular.element(document).ready ->
    angular.bootstrap(document, ['myApp'])