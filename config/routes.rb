Rails.application.routes.draw do
  resources :tasks do
    patch '/done' => 'tasks#done', as: :done
  end
  #put 'tasks/done/', action: :done, controller: 'tasks'

  resources :todos
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

end
