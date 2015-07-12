class ApplicationController < ActionController::Base
  after_filter :set_access_control_headers

  include ShopifyApp::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = 'http://toysinvest.com'
    headers['Access-Control-Request-Method'] = '*'
  end
end
