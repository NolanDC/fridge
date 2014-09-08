fridgeApp.controller 'DoorIndexController', ($scope, $http, $resource, DoorResource) ->
  $scope.doors = DoorResource.query()


  dispatcher = new WebSocketRails('localhost:3000/websocket');
  channel = dispatcher.subscribe('doors')
  
  channel.bind 'subscriber-joined', (data) ->
    # TODO don't get all of the doors
    for door, index in $scope.doors 
      if door.hex == data.hex
        $scope.$apply () ->
          door.subscribers+=1