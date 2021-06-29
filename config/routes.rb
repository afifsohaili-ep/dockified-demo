require 'sidekiq_unique_jobs/web'

Rails.application.routes.draw do
  root "home#index"

  resources :attachments
  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app

  resources :watches
  devise_for :users
  resources :documents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
