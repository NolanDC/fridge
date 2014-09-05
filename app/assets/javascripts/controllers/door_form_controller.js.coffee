fridgeApp.controller 'DoorFormController', ($scope, $http, $resource) ->
  $scope.init = (wordlist) ->
    $scope.words = wordlist

  $scope.remove = (word) ->
    index = $scope.words.indexOf(word)
    $scope.words.splice(index, 1);  

  $scope.createWord = (word) ->
    $scope.words.push(word);