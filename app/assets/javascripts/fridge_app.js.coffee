@fridgeApp = angular.module('fridgeApp', ['ngResource'])
  .directive 'ngDraggable', () ->
      restrict: 'A',
      link: (scope, elm, attrs) ->
        options = scope.$eval(attrs.ngDraggable)
        elm.draggable
          containment: 'parent'
          stop: (event, ui) ->
            $magnet = $(event.target)
            scope.magnet.x = $magnet.css('left')
            scope.magnet.y = $magnet.css('top')
            scope.magnet.$update()

@fridgeApp.directive 'focusInput', () ->
  link: (scope, element, attrs) ->
    element.on 'click', () ->
      $(attrs['focusInput']).focus()

@fridgeApp.directive 'ngEnter', () ->
  link: (scope, element, attrs) ->
    element.bind "keydown keypress", (event) ->
      if(event.which == 13)
        scope.$apply () ->
          scope.$eval(attrs.ngEnter, {'event': event})
        element.val('')
        event.preventDefault()
