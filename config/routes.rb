Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root "home#index"
   devise_for :users, controllers: { sessions: 'users/sessions' }
   devise_for :members, controllers: { sessions: 'members/sessions' }
   resources :user, :member, :product 
   resources :categories do
   	member do
   		patch :category_update
   	end
   end
   
end
