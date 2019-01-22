Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :to_dos, only: [:index, :create, :update, :destroy]
      post '/login', to: 'users#login'
      post '/register', to: 'users#register'
      get '/validate', to: 'users#validate'
    end
  end
end
