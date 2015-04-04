Ispec::Application.routes.draw do resources :projects
#root 'data#one'
devise_for :admin_users, ActiveAdmin::Devise.config
ActiveAdmin.routes(self)

root 'data#one'
#root 'magentos#index'
# devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" },path_names: {sign_in: "login", sign_out: "logout"}

get "quotations/index"
get "quotations/show"
get "quotations/build"
get "quotations/request"
get "quotations/add"


# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
# root 'welcome#index'

# Example of regular route:
#   get 'products/:id' => 'catalog#view'

# Example of named route that can be invoked with purchase_url(id: product.id)
#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

# Example resource route (maps HTTP verbs to controller actions automatically):
#   resources :products  resources :projects
resources :accounts
resources :sections
resources :subsections
resources :copysubs
resources :copysecs
resources :products
resources :globals
resources :project_steps
resources :trainings
resources :favourites
resources :quotes
resources :lineitems
resources :users
resources :installs
resources :tests
resources :versions
resources :magentos
resources :apis
resources :soaps
resources :saps
resources :sappushes
resources :magentos

get "magento_integration/importer"
get 'oauth' => 'magentos#oauth', :as => :oauth

get "projects/noprice"
#get "projects/sappull"

match 'import', to: 'import_single_product_magneto#import', via: [:post]

match 'import', to: 'import_single_product_magneto#create', via: [:get]

resources :projects do
  member do
    get :noprice
    get :techspec
    get :techspecnoprice
    get :consolidated
    get :consolidatednoprice
    get :toexcel
  end
end

get "users/delete"
get "users/show"


get "/welcome/index"
#get "/welcome"
get "/data/delete"
get "data/show"
get "data/list"
get "data/delete"
get "data/pdfnoprice"
get "data/pdf"
get "data/tech"
get "data/technoprice"
get "data/noprice"
get "data/generate"
get "data/one"
get "data/addfav"
get "data/addshow"
get "data/saveOpenQuote"
get "data/sappull"
get "project/updatesap"


namespace :api , defaults: {format: 'json'} do
  namespace :v1 do
    resources :accounts
    resources :sections
    resources :subsections
    resources :copysubs
    resources :copysecss
    resources :products
    resources :globals
    resources :projects
    resources :trainings
    resources :favourites
    resources :quotes
    resources :lineitems
    resources :users
    resources :installs
    resources :tests
    resources :versions
  end
end

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
