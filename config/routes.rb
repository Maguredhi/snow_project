Rails.application.routes.draw do
  devise_for :users
  # get 'messages/new'
  # get 'messages/create'
  resources :rooms do
    resources :messages
  end
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
