Rails.application.routes.draw do
  get 'photos/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  get 'maps/index'
  root to: 'maps#index'
  get 'maps/new'
  get 'photos/index'
  resources :maps, only: [:index, :new, :create, :destroy]
end
