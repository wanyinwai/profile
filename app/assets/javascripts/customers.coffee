# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  # get customer email and id on page load
  cust_email = document.getElementById('cust_email').innerHTML
  cust_id = document.getElementById('cust_id').innerHTML
  alert cust_email + ' ' + cust_id
  alert ("coffee script")
  return

$(document).ready(ready)
$(document).on('page:load', ready)