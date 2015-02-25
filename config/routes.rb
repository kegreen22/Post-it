PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destroy] do
  	member do #exposed to every resource of the member
	post :vote
	end
  
  resources :comments, only: [:create] do 
  		member do
		post :vote
		end
	end
	end
  
  resources :categories, only: [:new, :show, :create]

  resources :users, only: [:create, :update, :show, :edit]


get 'register', to: 'users#new'
 
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'

end