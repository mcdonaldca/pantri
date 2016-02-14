Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: "main#index", as: "index"

  # Example of regular route:
  get "fitbit" => "main#fitbit"
  get "lifx" => "main#lifx"
  get "summary" => "main#summary", :as => :summary
  get "pantry" => "main#pantry", :as => :pantry
  get "recipes" => "main#recipes", :as => :recipes
  get "calculate" => "main#get_food_group_servings", :as => :calculate
  get "api/lifx/all/toggle" => "main#lifx_toggle"

  get "api/alexa/dinner" => "alexa#dinner"
  get "api/alexa/check/:recipe" => "alexa#check_missing"
  get "api/alexa/expiring/:ing/:exp" => "alexa#mark_expiring"

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
