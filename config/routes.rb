Rails.application.routes.draw do
  root to: "auctions#index"
  resources :auctions, only: [:index] do
  	collection do
  		post :assign
  	end
  end
  resources :users
  resources :players do 
    collection do
      post :create_multiple
    end
  end
end
