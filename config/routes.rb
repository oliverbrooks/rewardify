Rewardify::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  resources :vendors do
    resources :offers
    resources :purchases
  end
end
