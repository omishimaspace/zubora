Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes
  namespace :api do
    namespace :v1 do
      resources :chefs, only: :index
      resources :recipes, only: :create
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
