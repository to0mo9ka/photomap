Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'top' => 'homes#top'
  get 'maps/index'
  root to: 'maps#index'
  resources :maps, only: [:index]
end
