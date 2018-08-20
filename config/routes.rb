Rails.application.routes.draw do
  get "/" , to: "posts#home"
  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new,:create,:show,:edit,:update]
  get "/favorites/:id", to: "users#favorites"
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
