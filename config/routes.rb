Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "pages#home"

  resources :finances
  resources :gratitudes
  resources :meals
  resources :notes
  resources :self_cares
  resources :users
  resources :completed_cares
  resources :goals do
    patch :complete
  end
  
  resources :pages do
    resources :finances
    resources :gratitudes
    resources :meals
    resources :notes
    resources :self_cares
    resources :completed_cares
    resources :goals do
      patch :complete
    end
  end

  get "daily", to: "pages#daily"
  get "monthly", to: "pages#monthly"

  get 'up_daily', to: 'sessions#up_daily'
  get 'down_daily', to: 'sessions#down_daily'
  get 'reset_daily', to: 'sessions#reset_daily'
  get 'up_monthly', to: 'sessions#up_monthly'
  get 'down_monthly', to: 'sessions#down_monthly'
  get 'reset_monthly', to: 'sessions#reset_monthly'
  get 'dark', to: 'application#dark'
  get 'light', to: 'application#light'
  get 'tracker_menu', to: 'pages#tracker_menu'
  get "account", to: "pages#account"
  patch 'confirm_invite', to: 'invitations#update'
  get "add_friend", to: "invitations#new"
  post "add_friend", to: "invitations#create"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
end