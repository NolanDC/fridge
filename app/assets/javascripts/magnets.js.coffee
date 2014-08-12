# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('.magnet').draggable
    stop: updateMagnet



updateMagnet = (event, ui) ->
  #$(this).css('color', 'red')


class Magnet
  constructor: (@x, @y) ->

  update: (x, y) ->
    

