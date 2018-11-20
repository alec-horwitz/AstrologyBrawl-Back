Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/users/random/:id', to: 'users#showRandom'
      # get '/users/login/:username/:password', to: 'users#showUser'
      resources :users, only: [:create, :show, :update, :index]
      get '/games/pages/:page', to: 'games#showPage'
      get '/games/pages', to: 'games#showNumPages'
      resources :games, only: [:create, :show]
      post '/sessions', to: 'sessions#create'
    end
  end

end
