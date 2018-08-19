Rails.application.routes.draw do
  get "/" , to: "posts#home"
  resources :posts do
    collection do
      post :confirm
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new,:create,:show]
  resources :favorites, only: [:create, :destroy]

end
