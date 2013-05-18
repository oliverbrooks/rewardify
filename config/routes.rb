Rewardify::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  get 'play' => 'plays#edit'
  get 'played' => 'plays#show'
  put 'play' => 'plays#update'

  namespace :admin do
    resources :vendors do
      resources :offers
      resources :purchases
      resources :users
    end
  end
end
