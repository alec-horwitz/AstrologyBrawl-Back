Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/users/random/:id', to: 'users#showRandom'
      get '/users/login/:username/:password', to: 'users#showUser'
      resources :users
      get '/games/pages/:page', to: 'games#showPage'
      get '/games/pages', to: 'games#showNumPages'
      resources :games
    end
  end

end
