Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      get '/backgrounds', to: 'backgrounds#index'
      get '/munchies', to: 'munchies#index'
      post '/users', to: 'users#create'
    end
  end
end
