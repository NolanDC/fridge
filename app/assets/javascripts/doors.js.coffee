# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ () ->
  $('.new-word').keypress (e) ->
    word = $(this).val()
    if e.which == 13
      $(this).before('<span class="word">' + word + '</span>')
      $(this).val('')
      return false

  $('.wordlist-wrapper').on 'click', '.word', () ->
    $(this).remove();

  $('.wordlist-wrapper').on 'click', () ->
    $('.new-word').focus();
