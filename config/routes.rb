Rails.application.routes.draw do


  resources :members
  get 'home/index'


  root :to => "home#index"


  as :user do
    #get   '/sign_up'   => 'users/registrations#new', as: :new_user_registration
    #post  '/sign_up'   => 'users/registrations#create', as: :user_registration
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => {
      :registrations => "registrations",
      :confirmations => "confirmations",
      :sessions => "milia/sessions",
      :passwords => "milia/passwords",
  }

  match '/plan/edit' => 'tenants#edit', via: :get, as: :edit_plan
  match '/plan/update' => 'tenants#update', via: [:put, :patch], as: :update_plan

end