Rails.application.routes.draw do
  use_payponty
  root :to => 'home#index'
end
