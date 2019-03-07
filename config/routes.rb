Rails.application.routes.draw do

  devise_for :users
  root 'products#index'

  get  'users/signout'  =>  'users#signout'

  get '/users/identification' => 'users#identification'

  resources :products, only: [:show, :new, :create] do
    resources :purchases, only: [:new, :create]
  end

  resources :users, only: [:new, :show, :edit] do
    resources :user_details, only: [:new, :create, :edit, :update, :show]
    resources :credit_card, only: [:new, :show]
  end


end
