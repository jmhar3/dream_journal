Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

  resources :finances
  resources :goals
  resources :gratitudes, only: [:new, :create, :edit, :update]
  resources :meals
  resources :notes
  resources :self_cares

  get "daily", to: "pages#daily"
  get "monthly", to: "pages#monthly"
  get "account", to: "pages#account"
  get "add_friend", to: "invitations#new"
  post "add_friend", to: "invitations#create"
  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'sign_out', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
end