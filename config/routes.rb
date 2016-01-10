# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#         filter_documents POST   /documents/filter(.:format)    documents#filter
#                documents GET    /documents(.:format)           documents#index
#                          POST   /documents(.:format)           documents#create
#             new_document GET    /documents/new(.:format)       documents#new
#            edit_document GET    /documents/:id/edit(.:format)  documents#edit
#                 document GET    /documents/:id(.:format)       documents#show
#                          PATCH  /documents/:id(.:format)       documents#update
#                          PUT    /documents/:id(.:format)       documents#update
#                          DELETE /documents/:id(.:format)       documents#destroy
#               user_index GET    /user(.:format)                user#index
#                          POST   /user(.:format)                user#create
#                 new_user GET    /user/new(.:format)            user#new
#                edit_user GET    /user/:id/edit(.:format)       user#edit
#                     user GET    /user/:id(.:format)            user#show
#                          PATCH  /user/:id(.:format)            user#update
#                          PUT    /user/:id(.:format)            user#update
#                          DELETE /user/:id(.:format)            user#destroy
#

Rails.application.routes.draw do
  resources :horses
  devise_for :users
  resources :documents do
    collection do
      post :filter
    end
  end
  resources :user
  resources :camel, only:[:show]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # 
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
