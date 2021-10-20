Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"

  resources :pages
  resources :finances
  resources :goals
  resources :gratitudes
  resources :meals
  resources :notes
  resources :self_cares
  resources :users
end
