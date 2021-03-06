Rails.application.routes.draw do

  root 'lists#index'
  
  #Users controller routes

  get 'users/' => 'lists#index'

  get 'signup' => 'users#new'

  get 'users/:id' => 'users#show', as: :user

  post 'users/' => "users#create"

  get "users/:id/edit" => "users#edit"

  patch "users/:id" => "users#update"

  delete "users/:id" => "users#destroy", as: :delete_user


  #Lists controller routes

  get 'lists/' => 'lists#index'

  get 'lists/new' => 'lists#new', as: :new_list

  get 'lists/:id' => 'lists#show', as: :list

  post 'lists/' => 'lists#create'

  delete 'lists/:id' => 'lists#destroy', as: :delete_list


  #Items controller routes

  get 'items/' => 'items#index'

  get 'items/new' => 'items#new', as: :new_item

  get 'items/:id' => 'items#show', as: :item

  post 'lists/:id/items' => 'items#create', as: :list_items

  get 'items/:id/edit' => 'users#edit'

  patch 'items/:id' => 'items#update'

  delete 'items/:id' => 'items#destroy', as: :delete_item


  #Sessions controller routes

  get '/login'     => 'sessions#new'

  post '/login'    => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  


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
