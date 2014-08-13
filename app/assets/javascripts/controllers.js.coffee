fridgeApp = angular.module('fridgeApp', ['ngResource'])
  .directive 'ngDraggable', () ->
      restrict: 'A',
      link: (scope, elm, attrs) ->
        options = scope.$eval(attrs.ngDraggable)
        elm.draggable
          stop: (event, ui) ->
            $magnet = $(event.target)
            scope.magnet.x = $magnet.css('left')
            scope.magnet.y = $magnet.css('top')
            scope.magnet.$update()

fridgeApp.controller 'FridgeController', ($scope, $http, $resource) ->
  window.Magnet = $resource("/doors/1/magnets/:id.json", {id: "@id"}, {update: {method: "PUT"}})
  $scope.magnets = Magnet.query()
  

