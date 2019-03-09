Rails.application.routes.draw do

  devise_for :users
  root 'products#index'

  resources :products, only: [:show, :new, :create] do
    resources :purchases, only: [:new, :create]
  end

  resources :categories, only: [:index, :show] do
  end

  resources :brands, only: [:index, :show] do
  end

  resources :users, only: [:new, :show, :edit] do
    collection do
      get 'signout'
    end
    resources :profiles, only: [:new]
    resources :credit_card, only: [:index, :new, :create]
  end


end
