Rails.application.routes.draw do
  resources :sessions
  resources :teams
  resources :studies
  resources :participants do
    resources :notes
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#home"
  
  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'users/:id/home', to: 'users#home', :as => :user_home

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  # These routes will be for signup. The first renders a form in the browse, the second will 
  # receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/pending_users' => 'users#pending'
  get '/inactive_users' => 'users#inactive'
  get '/approved_users' => 'users#approved'
  get '/denied_users' => 'users#denied'
  get '/admin_users' => 'users#admin'
  get '/notification_calendar' => 'users#notification_calendar'

  put '/remove_admin_rights/:id' => 'users#remove_admin_rights', :as => :remove_admin_rights
  put '/add_admin_rights/:id' => 'users#add_admin_rights', :as => :add_admin_rights
  put '/approve_user/:id' => 'users#approve_user', :as => :approve_user
  put '/reject_user/:id' => 'users#reject_user', :as => :reject_user

  get '/reset_password' => 'users#reset_password'
  post '/reset_password' => 'users#change_password'

  get '/forgot_password' => 'users#forgot_password'
  post '/forgot_password' => 'users#request_password'

end
