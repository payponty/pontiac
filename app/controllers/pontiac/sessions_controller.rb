module Pontiac
  class SessionsController < ApplicationController
    skip_before_filter :authenticate_shop!, only: [:new, :payponty_login]

    def new
      if params[:shop].present?
        redirect_to "/auth/payponty?shop=#{params[:shop].to_s.strip}"
      end
    end

    def payponty_login
      if signed_in?
        redirect_to main_app.root_path
      else
        redirect_to main_app.login_path(shop: params[:shop])
      end
    end

    def destroy
      cookies.delete(:shop_id)
      redirect_to main_app.root_path
    end
  end
end
