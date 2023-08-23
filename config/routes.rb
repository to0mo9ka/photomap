Rails.application.routes.draw do
  
  devise_for :users
  
  get 'maps/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  get 'maps/new'
  get 'photos/index'
  get 'photos/:id'=>'photos#show', as:'photo'
  
  resources :users, only: [:index, :show, :create, :edit, :update]
  resources :maps, only: [:index, :show, :new, :create, :destroy]
  resources :photos, only: [:index, :destroy]
end