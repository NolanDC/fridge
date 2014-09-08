fridgeApp.controller 'DoorIndexController', ($scope, $http, $resource, DoorResource) ->
  $scope.doors = DoorResource.query()