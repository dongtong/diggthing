ConnotiveCartoon::Application.routes.draw do


  get "books/index"
  match "books/show/:id" => 'books#show', :as => :books_show, :via => :get
  get "/about", to: 'about#index'

  get "cartoons/:nav/page/:page", to: 'cartoons#index'
  
  match "cartoons/check/list" => "cartoons#check_list", :as => :check_cartoons, :via => :get
  match "cartoons/check/:id" => "cartoons#check", :as => :check_cartoon, :via => :get
  match "user/:username" => "user#show", :as => :show_user, :via => :get
  get "user/edit"
  get "user/update"


  post "comments/create"
  post "comments/add_book_comment"

  devise_for :users

  root :to => 'cartoons#index'
  get "cartoons/index"
  match "cartoons/:nav/show/:id" => "cartoons#show", :as => :show_cartoons, :via => :get
  match "cartoons/download/:id" => "cartoons#download", :as => :download_cartoon, :via => :get
  get "/download/apk", to: "cartoons#download_apk", :as => :download_apk
  #match "cartoons/hot/page/:page" => "cartoons#get_hot", :as => :get_hot_cartoons, :via => :get
  #match "cartoons/lastest" => "cartoons#get_lastest"

  namespace :admin do 
    get "system/index"
    get "system/show_upload_apk"
    post "system/upload_apk"
    get "system/edit_apk/:id", to: 'system#edit_apk', :as => :system_edit_apk
    put "system/update_apk/:id", to: 'system#update_apk', :as => :system_update_apk


    get "categories/list"
    get "categories/new"
    # get "categories/show"
    post "categories/create"
    get "categories/edit/:id", to: "categories#edit", :as => "categories_edit"
    put "categories/update/:id", to: "categories#update", :as => "categories_update"
    #delete "categories/destroy/"
    delete "categories/destroy/:id", to: "categories#destroy", :as => "categories_destroy"

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
  
    get "books/list"
    get "books/new"
    match "books/create" => "books#create", :via => :post
    match "books/edit/:id" => "books#edit", :as => :edit_book, :via => :get
    match "books/update/:id" => "books#update", :as => :update_book, :via => :put
    match "books/destroy/:id" => "books#destroy", :as => :books_destroy, :via => :delete

    get "books/:book_id/sections/index" => "sections#index", :as => :book_sections
    get "books/:book_id/sections/new" => "sections#new", :as => :new_book_section
    get "books/:book_id/sections/show/:id" => "sections#show",:as => :show_book_section
    match "books/:book_id/sections/create" => "sections#create", :as => :create_book_section, :via => :post
    match "books/:book_id/sections/edit/:id" => "sections#edit", :as => :edit_book_section, :via => :get
    match "books/:book_id/sections/update/:id" => "sections#update", :as => :update_book_section, :via => :put
    match "books/:book_id/sections/destroy/:id" => "section#destroy", :as => :destroy_book_section, :via => :delete

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
