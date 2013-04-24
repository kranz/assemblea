# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $(".presenti").easyPieChart
    trackColor: "#f0f0f0"
    lineWidth: 30
    size: 330
    barColor: (percent) ->
      if ($(".presenti").data("differenza") < 0)
        "#ff0000"
      else
        "#33ff00"
