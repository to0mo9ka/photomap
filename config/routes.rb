Rails.application.routes.draw do
  get 'maps/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  
  root to: 'maps#index'
  get 'maps/new'
  get 'photos/index'
  get 'photos/:id'=>'photos#show', as:'photo'
  resources :maps, only: [:index, :show, :new, :create, :destroy]
  resources :photos, only: [:index, :destroy]

end
