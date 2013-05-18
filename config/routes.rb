Rewardify::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  resources :offers
  
  resources :vendors do
    resources :purchases
  end
end
