Waiveme::Application.routes.draw do
  resources :logins

  resources :approved_appointments

  resources :appointments

  resources :lecturers

  resources :departments

  resources :students

  
  get 'user_login' => "logins#login"  
  get 'department_faculty.json' => "departments#faculty"
  get 'lecturer_details' => "lecturers#details"
  get 'lecturer_details_clid' => "lecturers#details_clid"
  get 'request_appointment' => 'appointments#request_apointment'
  get 'request_appointment_clid' => 'appointments#request_appointment_clid'  
  get 'lecturer_appointments' => "lecturers#appointments"
  get 'modify_appointment' => "lecturers#modify_appointment"
  get 'login_create' => "logins#login_create"
  get '/student_appointment' => "students#appointments"
  
  
  get "welcome/index"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  post "signup" => "users#signup"
  get "profile" => "users#display_profile"
  post "profile_data" => "users#profile_data"
  post "update_profile" => "users#update_profile"
  post "update_profile_data" => "users#update_profile_data"
  get "edit_profile" => "users#edit_profile"
  
  
  #root :to => "users#new"
  resources :users
  resources :sessions
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
