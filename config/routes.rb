CrmMd::Application.routes.draw do

  root :to => 'activities#index'

  ActiveAdmin.routes(self)

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :activities
  resources :events do
    member do
      get "open_details"
    end
  end

  get "events_for_day", to: "events#events_for_day"
  get "profiles", to: 'users#index', as: :profiles
  get "error", to: 'welcome#index', as: :error
  post "versions/:id/revert" => "versions#revert", :as => "revert_version"
  get "search_all", to: "search_results#index"

  match "profile/:id", to: "users#show", as: 'profile'
  match "country_select_legal", to: "companies#country_select_legal", as: "country_select_legal"
  match "country_select_invoicing", to: "companies#country_select_invoicing", as: "country_select_invoicing"
  match "companies/:id/country_select_legal", to: "companies#country_select_legal", as: "country_select_legal"
  match "companies/:id/country_select_invoicing", to: "companies#country_select_invoicing", as: "country_select_invoicing"
  match "companies/search", to: "companies#search"
  match "contacts", to: "employees#index"

  resources :companies do
    member do
      get 'show_contacts'
      get 'show_address'
      get 'show_comments'
      get 'sales'
      get 'revisions'
      get 'delete_company'
    end
    resources :employees do
      member do
        get 'delete_employee'
      end
      resources :comments
    end
    resources :addresses
    resources :comments
    resources :sales

    collection { post :search, to: 'companies#search' }
  end

  resources :employees do
    member do
      get 'profile'
      get 'delete_employee'
      get 'revisions'
      get 'comments'
    end
    resources :comments
  end

  resources :sales
  resources :comments

  get "welcome/index"
  match 'set_locale' => 'welcome#set_locale'

  devise_for :users
  ActiveAdmin.routes(self)
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
