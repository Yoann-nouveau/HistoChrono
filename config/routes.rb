Rails.application.routes.draw do
  get 'monuments/new'
  get 'monuments/create'
  get 'redirection', to: 'periods#redirection'
  devise_for :users
  root to: "pages#home"
  resources :periods, only: [:index, :show] do
    resources :monuments, only: [:new, :create]
    resources :events, only: [:new, :create]
    resources :personalities, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
