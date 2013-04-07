# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#presenza_delegato').autocomplete
    source: $('#presenza_delegato').data('autocomplete-source')

  $('#search').focus()