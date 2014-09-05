fridgeApp.controller 'DoorFormController', ($scope, $http, $resource) ->
  $scope.init = (wordlist) ->
    $scope.words = wordlist

  $scope.remove = (word) ->
    index = $scope.words.indexOf(word)
    $scope.words.splice(index, 1);  


$ () ->
  $('.new-word').keypress (e) ->
    word = $(this).val()
    if e.which == 13
      $(this).before('<span class="word">' + word + '</span>')
      $(this).val('')
      return false
