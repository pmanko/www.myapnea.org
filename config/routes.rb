Rails.application.routes.draw do
  get 'dashboard', to: "patient#dashboard"
  get 'switch_theme/:theme', to: 'users#switch_theme', as: :switch_theme

  # Answer Sessions
  get 'survey/:question_flow_id', to: 'answer_sessions#start', as: :start_answer_session
  get 'survey/:question_flow_id', to: 'answer_sessions#finish', as: :finish_answer_session

  get 'survey/:answer_session_id/:question_id', to: 'answer_sessions#ask_question', as: :ask_question
  match 'survey', to: 'answer_sessions#process_answer', via: :post, as: :process_answer


  resources :question_flows

  resources :questions

  resources :question_types

  resources :answer_types

  resources :answer_options

  devise_for :users, path: '', path_names: { sign_up: 'sign_up', sign_in: 'sign_in' }, controllers: { registrations: 'user/registrations'}

  match 'pledge', to: "users#pledge", as: :pledge, via: [:get, :post]
  match 'consent', to: "users#consent", as: :consent, via: [:get, :post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'high_voltage/pages#home'

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
