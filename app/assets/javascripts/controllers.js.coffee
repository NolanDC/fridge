fridgeApp = angular.module('fridgeApp', [])
  .directive 'ngDraggable', () ->
      restrict: 'A',
      link: (scope, elm, attrs) ->
        options = scope.$eval(attrs.draggable)
        elm.draggable(options)

fridgeApp.controller 'FridgeController', ($scope, $http) ->
  $http.get('/doors/1/magnets.json').success (data) ->
    $scope.magnets = data

  $scope.$on 'ngRepeatFinished', () ->
    $('.magnet').draggable
