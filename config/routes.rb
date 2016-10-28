Rails.application.routes.draw do
  
  namespace :dynamic_select do
    get ':food_item_id/measurements', to: 'food_item_measurements#index', as: 'food_item_measurements'
  end
  
  resources :measurements, only: [:show, :edit, :update, :destroy]
  resources :food_items do
    resources :measurements, only: [:new, :create]
  end
  
  resources :meals
  
  resources :ingredients, only: [:show, :edit, :update, :destroy]
  resources :recipes do
    resources :ingredients, only: [:new, :create]
  end
  
  get  'welcome', to: 'welcome#index'
  root 'welcome#index'
end
