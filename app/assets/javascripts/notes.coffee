# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#notify_on_datetime_button').click (event) ->
    alert "page has loaded!"
    event.preventDefault()
    picker = $('.datepicker').pickadate('picker')
    picker.open()
    # $(this).hide()
    #$('.field#bio').show()
