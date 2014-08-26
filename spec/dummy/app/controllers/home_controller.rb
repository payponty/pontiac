class HomeController < ApplicationController
  skip_before_filter :authenticate_shop!, only: :index

  def index
    if signed_in?
      current_shop.use_kitpay
      @orders = Kitpay.orders per_page: 3
      @products = Kitpay.products per_page: 5
    else
      redirect_to login_path
    end
  end
end
