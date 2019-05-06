Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
  #get '/ec', :to => 'home#index'
  root "home#index"

  #  resources :user
  #  resources :member
  #  resources :orders
  #  resources :replenishes
  #  resources :product
  #  resources :categories
  #  resources :cart
  #  resources :users
  #  resources :members
  #  resources :home
   
   devise_for :users, controllers: { sessions: 'users/sessions' }
   devise_for :members, controllers: { sessions: 'members/sessions' }
   resources :user, :member, :orders, :replenishes, :product


   resources :categories do
   	member do
   		patch :category_update
   	end
   end

   resource :cart, only:[:show, :destroy] do
   	collection do
   		post :add, path: 'add/:id'
   	end
   end
   
   
end
