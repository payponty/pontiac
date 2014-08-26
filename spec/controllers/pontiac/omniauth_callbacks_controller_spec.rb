require 'spec_helper'

describe Pontiac::OmniauthCallbacksController do

  let(:shop) { 'test-store.myponty.com' }

  context '#payponty' do

    context 'with auth' do

      before do
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:payponty]
      end

      it 'should be success' do
        get :payponty, shop: shop, use_route: :pontiac
        response.should redirect_to('/')
      end

    end

    context 'without auth' do

      it 'should be fail' do
        get :payponty, shop: shop, use_route: :pontiac
        response.should redirect_to('/login')
      end

    end

  end

end
