Rails.application.routes.draw do
  get 'doses/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails do
    resources :doses
    resources :ingredients
  end
end
