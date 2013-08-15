ConnotiveCartoon::Application.routes.draw do
  match "cartoons/check/list" => "cartoons#check_list", :as => :check_cartoons, :via => :get
  match "cartoons/check/:id" => "cartoons#check", :as => :check_cartoon, :via => :get
  match "user/:username" => "user#show", :as => :show_user, :via => :get
  get "user/edit"
  get "user/update"


  post "comments/create"

  devise_for :users

  root :to => 'cartoons#index'
  get "cartoons/index"
  match "cartoons/:nav/show/:id" => "cartoons#show", :as => :show_cartoons, :via => :get
  match "cartoons/download/:id" => "cartoons#download", :as => :download_cartoon, :via => :get
  match "cartoons/hot" => "cartoons#get_hot", :as => :get_hot_cartoons, :via => :get
  match "cartoons/lastest" => "cartoons#get_lastest"

  namespace :admin do 
    get "cartoons/index"
    get "cartoons/list"
    get "cartoons/new"
    get "cartoons/show"
    get "cartoons/create"
    get "cartoons/edit"
    get "cartoons/update"
    match "cartoons/destroy/:id" => "cartoons#destroy", :as => :destroy_cartoon, :via => :delete
    post "cartoons/import"
    post "cartoons/get_cartoons_list"

    get "scrap_sources/list"
    get "scrap_sources/new"
    match "scrap_sources/show/:id" => "scrap_sources#show", :as => :show_scrap_source, :via => :get
    match "scrap_sources/create" => "scrap_sources#create", :as => :create_scrap_source, :via => :post
    match "scrap_sources/edit/:id" => "scrap_sources#edit", :as => :edit_scrap_source, :via => :get
    match "scrap_sources/update/:id" => "scrap_sources#update", :as => :update_scrap_source, :via => :put
    match "scrap_sources/destroy/:id" => "scrap_sources#destroy", :as => :destroy_scrap_source, :via => :delete
  end
  

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
end
