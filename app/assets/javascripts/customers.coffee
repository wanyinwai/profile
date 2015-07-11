# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@passUserInfo = () ->
  $.ajax
  url: 'userinfo'
  type: 'POST'
  headers: {
        'X-Transaction': 'POST userinfo',
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
  data: 'customer_email=' + "helloworld"
  success: (response) ->
    alert "success"
  error: ->
    alert "error"
  return

@getUserInfo = () ->
  # get customer email and id on page load
  alert('hello alert')

  customer_email = document.getElementById('cust_email').innerHTML
  customer_id = document.getElementById('cust_id').innerHTML

  console.log customer_email
  console.log customer_id
  

  console.log "hello"

  return

$(document).ready(@getUserInfo)
$(document).on('page:load', @getUserInfo)




