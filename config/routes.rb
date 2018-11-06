Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users
  resources :sessions
  post 'login', to: 'sessions#create'
end
