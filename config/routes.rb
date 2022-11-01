# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'about', to: 'about#index'

  root 'main#index'

  get 'sign-up', to: 'registrations#new'
  post 'sign-up', to: 'registrations#create'

  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'

  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  get 'sign-in', to: 'sessions#new'
  post 'sign-in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :twitter_accounts
  resources :tweets

  get '/auth/twitter/callback', to: 'omniauth_callbacks#twitter'
end
