Rails.application.routes.draw do
  get 'mailing_list', to: "mailing_lists#show", as: :mailing_list
  get 'thank_you', to: "mailing_lists#thank_you", as: :thank_you_ml
  post 'put_on_list', to: "mailing_lists#create", as: :put_on_list
  get 'warning', to: 'mailing_lists#warning', as: :warning

  scope "(:locale)", locale: /en|es|pl/ do

    # Static Pages
    get 'network', to: "pages#network", as: :network
    get 'faqs', to: "pages#faqs", as: :faqs
    get 'team', to: "pages#team", as: :team
    get 'privacy-policy', to: "pages#privacy_policy", as: :privacy_policy
    get 'thank-you', to: "pages#thank_you", as: :thank_you
    get 'version', to: 'pages#version', as: :version



    get 'dashboard', to: "patient#dashboard"
    get 'switch_theme/:theme', to: 'users#switch_theme', as: :switch_theme

    # Answer Sessions
    get 'survey/:question_flow_id', to: 'answer_sessions#start', as: :start_answer_session
    get 'survey/:answer_session_id/review', to: 'answer_sessions#finish', as: :finished_answer_session

    get 'survey/:answer_session_id/:question_id', to: 'answer_sessions#ask_question', as: :ask_question
    match 'survey', to: 'answer_sessions#process_answer', via: :post, as: :process_answer


    resources :question_flows

    resources :questions

    resources :question_types

    resources :answer_types

    resources :answer_options

    devise_for :users, path: '', path_names: { sign_up: 'sign_up', sign_in: 'sign_in' }, controllers: { registrations: 'user/registrations', sessions: 'user/sessions'}

    match 'pledge', to: "users#pledge", eas: :pledge, via: [:get, :post]
    match 'consent', to: "users#consent", as: :consent, via: [:get, :post]
  end

  get '/:locale' => 'mailing_lists#show'

  root 'mailing_lists#show'


end
