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

  $scope.init = (id) ->
    Magnet = $resource("/doors/:door_id/magnets/:id.json", {door_id: id, id: "@id"}, {update: {method: "PUT"}})
    $scope.magnets = Magnet.query()
    window.magnets = $scope.magnets

    dispatcher = new WebSocketRails('localhost:3000/websocket');
    channel = dispatcher.subscribe("door-#{id}")
    channel.bind 'update', (magnet) ->

      # Eventually replace with Service-cache, rather than loop
      for m in $scope.magnets 
        if m.id == magnet.id
          m.$get()


    

