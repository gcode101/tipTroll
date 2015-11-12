Rails.application.routes.draw do

  root 'homes#index'
  get 'sessions/new'
  get 'pro_ratings/update'
  get 'cust_ratings/update'

  get 'customers/:id' => 'customers#show'

    get 'professionals/search', to: 'professionals#search'

  resources :professionals
  resources :customers
  resources :charges
  resources :cust_ratings, only: :update
  resources :pro_ratings, only: :update

  post 'ratings/new', to: 'ratings#new'


  resources :professionals do
    put :favorite, on: :member
  end


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



  get '/signup' => 'customers#new'
  post '/customers' => 'customers#create'




  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create_customer'
  get '/logout' => 'sessions#destroy_customer'



  get '/pro_signup' => 'professionals#new'
  post '/professionals' => 'professionals#create'


  get '/pro_login' => 'sessions_pro#new'
  post '/pro_login' => 'sessions_pro#create_professional'
  get '/pro_logout' => 'sessions_pro#destroy_professional'










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
