# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  # get customer email and id on page load
  cust_email_elem = document.getElementById('cust_email')
  cust_email = cust_elem.innerHTML
  cust_id_elem = document.getElementById('cust_id')
  cust_id = cust_elem.innerHTML

  console.log
  return

$(document).ready(ready)
$(document).on('page:load', ready)