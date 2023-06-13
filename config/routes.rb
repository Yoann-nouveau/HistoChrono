Rails.application.routes.draw do
  get 'redirection', to: 'periods#redirection'
  devise_for :users
  root to: "pages#home"
  resources :markers, only: [:index]
  resources :approvals, only: [:index, :create, :update]
  resources :periods, only: [:show] do
    resources :monuments, only: [:create]
    resources :events, only: [:create]
    resources :personalities, only: [:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
