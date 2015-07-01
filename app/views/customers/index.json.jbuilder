json.array!(@customers) do |customer|
  json.extract! customer, :id, :customer_id, :email, :occupation, :birthday, :shop_domain
  json.url customer_url(customer, format: :json)
end
