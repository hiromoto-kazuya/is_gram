Rails.application.routes.draw do
  get "/", to: "users#new"

  resources :posts do
    collection do
      post :confirm
    end
    resources :comments
  end

  resources :users
  get "/favorites/:id", to: "users#favorites"
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
