Rails.application.routes.draw do
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
  #

  post  "/user" => "user#create_user"
  post "/user/:user_id/cube" => "cube#create_cube"
  post "/user/:user_id/content" => "content#create_content"
  post "/user/:user_id/cube/:cube_id/content" => "content#add_content_to_cube"
  delete "/user/:user_id/cube/:cube_id/content/:content_id" => "content#delete_content_from_cube"
  delete "/user/:user_id/cube/:cube_id" => "cube#delete_cube"
  post "/user/:share_user_id/cube/:cube_id/share" => "cube#share_cube"
  post "/user/:share_user_id/content/:content_id/share" => "content#share_content"
  get "/user/:user_id/cube" => "cube#list_cube"
  get "/user/:user_id/content" => "content#list_content"


end
