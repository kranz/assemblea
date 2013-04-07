# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $(".scegli").click ->
    $.ajax
      url: "/setassemblea/" + $(this).data('id')
      success: (dati) ->
        $("#my-result").html dati.assemblea_id
        asblid = '#asbl'+ dati.old_id
        newasblid = "#asbl" + dati.assemblea_id
        $(newasblid).addClass('success')
        $(asblid).removeClass('success')
        $('#curasname').html 'Assemblea in corso:' + dati.nomeass
      dataType: "json"
