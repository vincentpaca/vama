Vama::Application.routes.draw do
  resources :dashboard
  resources :profiles
  resources :products
  resources :reservations
  resources :purchases do
    member do
      get :export_to_csv
    end
  end

  get :company_profile, :controller => :home, :action => :company_profile
  get :show_room, :controller => :home, :action => :show_room
  get :service_center, :controller => :home, :action => :service_center
  get :faq, :controller => :home, :action => :faq
  get :contact_us, :controller => :home, :action => :contact_us

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  root :to => 'home#index'
end
