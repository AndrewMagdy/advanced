Rails.application.routes.draw do
    namespace :api, defaults: { format: :json }do
        namespace :v1 do
            resources :users, :posts, :sessions, :comments, :friendships
            post 'friendships/:id/accept', to: 'friendships#accept'
            get 'friendships/:user_id/unfriend/:friend_id', to: 'friendships#unfriend'
            get 'posts/:user_id/myposts', to: 'posts#myposts'
            get 'friendships/:user_id/myrequests', to: 'friendships#myrequests'
            get 'friendships/:user_id/newFriend/:friend_id', to: 'friendships#newFriend'
            get 'posts/:post_id/comments/', to: 'comments#showComments'
            get 'settings/:user_id', to: 'settings#show'
            post 'settings/:user_id/update', to: 'settings#updateOrCreate'
            get 'posts/:user_id/timeline', to: 'posts#timeline'
            get 'friendships/:user_id/friends', to: 'friendships#myfriends'
            get 'friendships/:user_id/isfriends/:friend_id', to: 'friendships#isfriends'
            post '/login', to: 'users#login'
        end
    end
    get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'
    root 'welcome#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
