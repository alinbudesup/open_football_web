require 'sidekiq/web'
Rails.application.routes.draw do


  mount Sidekiq::Web => '/sidekiq'

  resources :players
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
