Rails.application.routes.draw do

  root 'tasks#index'

  get 'tasks' => 'tasks#index'
  get 'tasks/new' => 'tasks#new'
  post 'tasks' => 'tasks#create'

  get 'tasks/:id', to: 'tasks#show', as: 'task' #this route shows a specifically identified task from the database

  get 'tasks/:id/edit' => 'tasks#edit', as: 'tasks_edit'
  patch 'tasks/:id' => 'tasks#update'

  delete 'tasks/:id', to: 'tasks#destroy'

  # User authentication
  get "/auth/:provider/callback" =>  "sessions#create"
  #get "/sessions", to: "sessions#index", as: "sessions"
  # get "/auth/login", to: "sessions#login", as: "login"
  delete "/auth/logout", to: "sessions#logout", as: "logout"


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
