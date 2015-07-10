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

    # ShopifyAPI::Base.activate_session(ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token))
    # ShopifyAPI::ScriptTag.create(:event => "onload", :src => "http://customer-profile.herokuapp.com/assets/application-fe4f375d1b5f72292e284437c5bb4a706261465da60f30d9d6b18ef5807331dc.js")

  rescue ActiveRecord::RecordNotFound
    nil
  end
end
