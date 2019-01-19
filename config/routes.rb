Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :to_dos, only: [:index, :create, :update, :destroy]
      resources :users, only: [:login, :register]
      post '/login', to: 'users#login', as: 'login'
      post '/register', to: 'users#register', as: 'register'
    end
  end
end
