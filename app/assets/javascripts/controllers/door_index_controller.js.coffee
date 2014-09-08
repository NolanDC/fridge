fridgeApp.controller 'DoorIndexController', ($scope, $http, $resource, DoorResource) ->
  $scope.doors = DoorResource.query()


  dispatcher = new WebSocketRails('localhost:3000/websocket');
  channel = dispatcher.subscribe('doors')
  
  channel.bind 'subscriber-joined', (data) ->
    # TODO use service to get cached doors rather than checking for hex equivalence
    for door, index in $scope.doors 
      if door.hex == data.hex
        $scope.$apply () ->
          door.subscribers+=1