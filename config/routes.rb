Rails.application.routes.draw do
  get "/" , to: "posts#home"
  resources :posts do
    collection do
      post :confirm
    end
  end



end
