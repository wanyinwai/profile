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

  customer_email_html = document.getElementById('cust_email').innerHTML
  customer_id_html = document.getElementById('cust_id').innerHTML

  console.log "reach displayMembership()"

  # customer_email_html = "geoffrey@gurlstudio.com"
  # customer_id_html = 1234567888

  customer_email = customer_email_html
  customer_id = customer_id_html

  # url: 'http://customer-profile.herokuapp.com/userinfo'
  # 'https://localhost:3001/userinfo'
  $.ajax
    url: 'http://customer-profile.herokuapp.com/userinfo'
    type: 'POST'
    data: 'customer_email='+customer_email+'&customer_id='+customer_id
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

$(document).ready(@displayMembership)
$(document).on('page:load', @displayMembership)
