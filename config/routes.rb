# frozen_string_literal: true
Rails.application.routes.draw do

  # get 'static_pages/home'
  # # root 'static_pages#home'
  # get 'static_pages/help'
  # get 'static_pages/about'
  # get 'static_pages/contact'

  root               'static_pages#home'
  get 'help'      => 'static_pages#help'
  get 'about'     => 'static_pages#about'
  get 'contact'   => 'static_pages#contact'
  get 'signup'    => 'users#new'

  get 'login'     => 'sessions#new'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  resources :users
end
