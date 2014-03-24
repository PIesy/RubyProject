# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(".track").click ->
  id = @id
  action = "/tracks/" + id
  $.ajax
    url: action
    type: "DELETE"
  $(this).parent().remove()
  return


$(".user").click ->
  user_id = @id
  id = $(@).data "event"
  action = "/events/" + id + "/remove_participant/?custom_user=" + user_id
  $.ajax
    url: action
    type: "GET"
  $(this).parent().remove()
  return