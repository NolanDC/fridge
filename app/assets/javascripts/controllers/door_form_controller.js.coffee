fridgeApp.controller 'DoorFormController', ($scope, $http, $resource) ->
  $scope.init = (wordlist) ->
    $scope.door = {words: wordlist}

  $scope.remove = (word) ->
    index = $scope.door.words.indexOf(word)
    $scope.door.words.splice(index, 1);  

  $scope.createWord = (word) ->
    $scope.door.words.push(word);

  $scope.createDoor = (e) ->
    $.post '/doors', {door: $scope.door}, (result) ->
      console.log(result)
