@fridgeApp = angular.module('fridgeApp', ['ngResource', 'ui.utils'])
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

@fridgeApp.factory 'DoorResource', ($resource) ->
  return $resource('/doors/:id.json', {id: '@id'})

@fridgeApp.filter 'removeExtension', () ->
  (url, params) ->
    url.replace(/\.[^/.]+$/, "")
