Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: %i[show index] do
    resources :posts, only: %i[show index new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: %i[create]
    end
  end
end
