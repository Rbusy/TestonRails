Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  post 'welcome/login', to: 'welcome#login', as: 'welcome_login'
end
