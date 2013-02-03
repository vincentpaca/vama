Vama::Application.routes.draw do
  resources :dashboard
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  root :to => 'home#index'
end
