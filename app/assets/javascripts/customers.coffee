# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


  



@printHello = () ->
  $.ajax
  url: '/userinfo'
  type: 'POST'
  beforeSend: (xhr) ->
    xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
    return
  data: 'someData=' + "helloworld"
  success: (response) ->
    $('#someDiv').html response
  
  return

// @get_ready = () ->
//   # get customer email and id on page load
//   alert('hello alert')

//   cust_email_2 = document.getElementById('cust_email').innerHTML
//   cust_id_2 = document.getElementById('cust_id').innerHTML

//   console.log cust_email_2
//   console.log cust_id_2
//   console.log "hello"

//   return

// $(document).ready(@get_ready)
// $(document).on('page:load', @get_ready)




