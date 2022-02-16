Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # get 'messages/new'
  # get 'messages/create'
  resources :rooms do
    resources :messages
  end
  resources :posts
  # /@username/title
  get '@:username/:post_id', to: 'pages#show', as: 'post_page'
  # /@username/
  get '@:username', to: 'pages#user', as: 'user_page'

  # Defines the root path route ("/")
  root "pages#index"
end
