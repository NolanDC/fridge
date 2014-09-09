fridgeApp.controller 'DoorFormController', ($scope, $http, $resource, DoorResource) ->
  $scope.init = (wordlist) ->
    $scope.door = {words: wordlist}

  $scope.remove = (word) ->
    index = $scope.door.words.indexOf(word)
    $scope.door.words.splice(index, 1)

  $scope.createWord = ($event) ->
    console.log $scope.newWord
    $scope.door.words.push($scope.newWord)
    $scope.newWord = ''
    $event.preventDefault()

  $scope.createDoor = () ->
    door = new DoorResource({door: $scope.door})
    door.$save()

  $scope.removeLastWord = ($event) ->
    console.log 'removing'
    $scope.door.words.pop() if $scope.newWord == ""
