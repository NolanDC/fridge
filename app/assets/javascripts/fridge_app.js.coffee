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

@fridgeApp.factory 'DoorResource', ($resource) ->
  return $resource('/doors/:id.json', {id: '@id'})

@fridgeApp.filter 'removeExtension', () ->
  (url, params) ->
    url.replace(/\.[^/.]+$/, "")

# Keybind directive by Alex G, found here: 
# http://stackoverflow.com/questions/15417125/submit-form-on-pressing-enter-with-angularjs
@fridgeApp.constant 'keyCodes', {
    esc: 27,
    space: 32,
    enter: 13,
    tab: 9,
    backspace: 8,
    shift: 16,
    ctrl: 17,
    alt: 18,
    capslock: 20,
    numlock: 144
  }

@fridgeApp.directive 'keyBind', ['keyCodes', (keyCodes) ->

  map = (obj) ->
    mapped = {}
    for key of obj
      action = obj[key]
      if keyCodes.hasOwnProperty(key)
          mapped[keyCodes[key]] = action

    return mapped

  (scope, element, attrs) ->
    bindings = map(scope.$eval(attrs.keyBind))
    console.log bindings
    element.bind 'keydown keypress', (event) ->
      if bindings.hasOwnProperty(event.which)
        scope.$apply () ->
          scope.$eval(bindings[event.which])
          element.val('') 
          event.preventDefault()
]