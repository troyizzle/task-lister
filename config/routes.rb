# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :patients do
    namespace :task do
      resources :items
    end
  end
  root 'patients#index'

  namespace :task do
    resources :lists do
      resources :items
      get '/items/:id/archive', to: 'items#archive', as: :item_archive
    end
    get '/lists/:id/archive', to: 'lists#archive', as: :list_archive
  end

  resources :patients
  resources :patients, module: :patients do
    resource :task, module: :task do
      resources :lists
      get '/items/:id/complete', to: 'items#complete', as: :item_complete
    end
  end
end
