Rewardify::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  get 'play'   => 'plays#edit'
  put 'play'   => 'plays#update'
  get 'played' => 'plays#show'

  resources :vendors, only: [:show]

  namespace :admin do
    resources :vendors do
      resources :offers
      resources :purchases
      resources :users
    end
  end
end
