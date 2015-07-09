# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  # get customer email and id on page load
  cust_email_elem = document.getElementById('cust_email')
  cust_email = cust_email_elem.innerHTML
  cust_id_elem = document.getElementById('cust_id')
  cust_id = cust_id_elem.innerHTML

  console.log cust_email+" "+cust_id 
  console.log "Hello"

  cust_email_2 = document.getElementById('cust_email').innerHTML
  cust_id_2 = document.getElementById('cust_id').innerHTML

  console.log cust_email_2
  console.log cust_id_2

  return

$(document).ready(ready)
