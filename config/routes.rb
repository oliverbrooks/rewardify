Rewardify::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  namespace :admin do
    resources :vendors do
      resources :offers
      resources :purchases
    end
  end
end
