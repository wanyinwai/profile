# Replace InMemorySessionStore with model called "Shop"
class Shop < ActiveRecord::Base
  def self.store(session)
  	shop = Shop.find_or_initialize_by(shopify_domain: session.url)
	shop.shopify_token = session.token
    #shop = self.new(domain: session.url, token: session.token)
    shop.save!
    shop.id
  end

  def self.retrieve(id)
    if shop = self.where(id: id).first
      ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
    end
  end
end

ShopifyApp::SessionRepository.storage = 'Shop'
