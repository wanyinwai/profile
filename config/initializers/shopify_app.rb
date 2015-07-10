ShopifyApp.configure do |config|
  config.api_key = ENV["SHOPIFY_API_KEY"]
  config.secret = ENV["SHOPIFY_SHARED_SECRET"]
  config.scope = "read_orders, read_products, read_customers, write_customers, read_script_tags, write_script_tags"
  config.embedded_app = true
end
