Rails.application.routes.draw do
  resources :movies do
    collection do
      post :search # update를 보낼땐 post가 필요"?
      # "search_movies_path"	POST	/movies/search(.:format)	movies#search
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "movies#index"
end
