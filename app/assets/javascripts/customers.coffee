# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# @goodpass = () ->
#   console.log "-->"
#   console.log $('meta[name="csrf-token"]').attr('content')
#
#   customer_email = "geoffreyleow@gmail.com"
#   customer_id = 12345678
#   $.ajax
#     url: 'https://localhost:3001/userinfo'
#     type: 'POST'
#     data: 'customer_email='+customer_email
#     headers: {
#         'X-Transaction': 'POST userinfo',
#         'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
#     }
#     success: (data) ->
#       console.log "Successfully passed data in ajax."
#       console.log data['customer_email_result']
#       $('#qr_img', '#qr_ptag').attr 'src', data['customer_email_result']
#       return
#     error: (e) ->
#       console.log "Ajax thrown an error."
#       return
#   console.log "it did reach here 2"


@displayMembership = () ->

  # customer_email = document.getElementById('cust_email').innerHTML
  # customer_id = document.getElementById('cust_id').innerHTML

  console.log "it did reach pass()"
  customer_email = "geoffreyleow@gmail.com"
  #customer_id = 12345678
  $.ajax
    #url: '/userinfo'
    url: 'https://localhost:3001/userinfo'
    type: 'POST'
    data: 'customer_email='+customer_email
    headers: {
        'X-Transaction': 'POST userinfo',
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
    success: (data) ->
      console.log "Successfully passed data in ajax."
      console.log data['customer_email_result']

      # select img tag in index and display qrcode
      $('#member_qrcode').append '<p><strong>Membership Code:</strong><p id="qr_ptag"><img id="qr_img"></img></p></p>'
      $('#qr_img', '#qr_ptag').attr 'src', data['customer_email_result']
      return
    error: (e) ->
      console.log "Ajax thrown an error."
      return
  console.log "it did reach here 2"


# @getUserInfo = () ->
#   # get customer email and id on page load
#   alert('getUserInfo')
#
#   customer_email = "geoffreyleow@gmail.com"
#   customer_id = 12345678
#
#   # customer_email = document.getElementById('cust_email').innerHTML
#   # customer_id = document.getElementById('cust_id').innerHTML
#
#   console.log customer_email
#   console.log customer_id
#
#   @passUserInfo(customer_email, customer_id)
#
#   return
#
# $(document).ready(@pass())
# #$(document).on('page:load', @getUserInfo)
