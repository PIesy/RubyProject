# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$("span.glyphicon-remove").click ->
  id = @id
  action = "/tracks/" + id
  $.ajax
    url: action
    type: "DELETE"
  $(this).parent().remove()
  return
