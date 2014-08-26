class Shop < ActiveRecord::Base
  attr_accessible :shop_id, :name, :fwm_domain

  def self.find_for_payponty_oauth(data)
    shop_data = data.extra.raw_info.shop
    shop = where(shop_id: shop_data.id).first_or_create! name: shop_data.name, fwm_domain: shop_data.fwm_domain
    shop.access_token = data.credentials.token
    shop.tap(&:save)
  end

  def use_kitpay
    Kitpay.setup url: self.fwm_domain, access_token: self.access_token
  end

  def admin_url
    "#{SecretSetting.fwm_domain.protocol}#{self.fwm_domain}/admin"
  end

  def front_url
    "http://#{self.fwm_domain}"
  end
end
