# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#new_sap").on("ajax:complete", (e, data, status, xhr) ->
    $("#new_sap").append xhr.responseText
  )
