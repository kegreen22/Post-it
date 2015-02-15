PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

get 'register', to: 'users#new'
 
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'

  resources :posts, except: [:destroy] do
  	member do #exposed to every resource of the member
	post :vote
	end
  	resources :comments, only: [:create, :show] do 
  		member do
		post :vote
		end
	end
	end
  
  resources :categories, only: [:new, :show, :create]

  resources :users, only: [:new, :create, :update, :show, :edit]
end
