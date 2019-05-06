Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
  get '/ec', :to => 'home#index'
  root "home#index"

   resources :user, path: "/ec/user"
   resources :member, path: "/ec/member"
   resources :orders, path: "/ec/orders"
   resources :replenishes, path: "/ec/replenishes"
   resources :product, path: "/ec/product"
   resources :categories, path: "/ec/categories"
   resources :cart, path: "/ec/cart"
   resources :users, path: "/ec/users"
   resources :members, path: "/ec/members"
   resources :home, path: "/ec/home"
   
   devise_for :users, controllers: { sessions: 'users/sessions' }
   devise_for :members, controllers: { sessions: 'members/sessions' }
   #resources :user, :member, :orders, :replenishes, :product


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
