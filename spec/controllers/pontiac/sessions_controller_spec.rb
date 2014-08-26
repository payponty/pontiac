require 'spec_helper'

describe Pontiac::SessionsController do

  let(:fwm_domain) { 'test-store.myponty.com' }

  context '#new' do

    it 'should be show' do
      get :new
      response.should be_success
    end

    it 'should be login' do
      post :new, shop: fwm_domain
      response.should be_redirect
    end

  end

  context '#payponty_login' do

    context 'with cookies' do

      let(:shop) { FactoryGirl.create :shop }

      before do
        cookies = mock('cookies')
        cookies.stub!(:signed).and_return({shop_id: shop.id})
        controller.stub!(:cookies).and_return(cookies)
      end

      it 'should show dashboard' do
        get :payponty_login, shop: fwm_domain
        response.should redirect_to('/')
      end

    end

    context 'without cookies' do

      it 'should redirect to payponty auth' do
        get :payponty_login, shop: fwm_domain
        response.should redirect_to("/login?shop=#{fwm_domain}")
      end

    end


  end

  context '#destroy' do

    it 'should be success' do
      put :destroy, use_route: :pontiac
      response.should redirect_to("/")
    end

  end

end
