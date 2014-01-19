SongBook::Application.routes.draw do
  resources :songs

  root to: 'book#index', as: 'store'

  match '/book/fill', to: 'book#fill', via: 'get', as: 'book_fill'
  match '/book/clean', to: 'book#clean', via: 'get', as: 'book_clean'

  get "book/index"
  
  #match '/artists', to: 'artists#index', via: 'get'
  resources :artists
  match '/artists/:artist_id/songs(/page/:page)', to: 'songs#by_artist', via: 'get', as: 'songs_by_artist'
  match "/artists(/page/:page)", to: "artists#index", via: 'get'
  
  match "/songs(/page/:page)", to: "songs#index", via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
