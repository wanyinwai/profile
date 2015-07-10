class SessionStorage
  def self.store(session)
    shop = Shop.find_or_initialize_by(shopify_domain: session.url)
    shop.shopify_token = session.token
    shop.save!
    shop.id
  end

  def self.retrieve(id)
    return unless id
    shop = Shop.find(id)
    ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)

    ShopifyAPI::Base.activate_session(ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token))
    scriptTag = ShopifyAPI::ScriptTag.create(:event => "onload", :src => "http://customer-profile.herokuapp.com/assets/#{ActionController::Base.helpers.asset_path('application.js')}")
    scriptTag.save

  rescue ActiveRecord::RecordNotFound
    nil
  end
end
