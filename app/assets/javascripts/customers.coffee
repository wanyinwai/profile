# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@pass = (something) ->
  console.log "it did reach pass()"
  #customer_email = something_passed_in
  customer_email = "geoffreyleow@gmail.com"
  $.ajax
    #url: '/userinfo'
    url: 'https://localhost:3001/userinfo'
    type: 'POST'
    data: 'customer_email='+ customer_email
    success: (data) ->
      console.log "Successfully passed data in ajax."
      # display data return from controller
      console.log data['customer_email_result']
      # select img tag in index and display qrcode
      $('#qr_img', '#qr_ptag').attr 'src', data['customer_email_result']

      return
    error: (e) ->
      console.log "Ajax thrown an error."

      #console.log e.message
      return

  console.log "it did reach here 2"



# @passUserInfo = (customer_email_passed) ->
#   console.log "did I get here?"
#   $.ajax
#   url: 'userinfo'
#   type: 'POST'
#   data: 'customer_email' : "hello world yo"
#   # headers: {
#         # 'X-Transaction': 'POST userinfo'
#         # 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
#         # }
#   success: (response) ->
#   	console.log("Pass success")
#   error: ->
#   	console.log("Data message error.")
#
#   # alert("passUserInfo "+ customer_email_passed)
#
#   return

# @getUserInfo = () ->
#   # get customer email and id on page load
#   alert('getUserInfo')
#
#   customer_email = "geoffreyleow@gmail.com"
#   customer_id = undefined
#
#   # customer_email = document.getElementById('cust_email').innerHTML
#   # customer_id = document.getElementById('cust_id').innerHTML
#
#   console.log customer_email
#   console.log customer_id
#
#   @passUserInfo(customer_email)
#
#   return
#
# $(document).ready(@getUserInfo())
# #$(document).on('page:load', @getUserInfo)
