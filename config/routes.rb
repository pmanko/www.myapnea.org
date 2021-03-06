Rails.application.routes.draw do
  get 'mailing_list', to: "mailing_lists#show", as: :mailing_list
  get 'thank_you', to: "mailing_lists#thank_you", as: :thank_you_ml
  post 'put_on_list', to: "mailing_lists#create", as: :put_on_list
  get 'warning', to: 'mailing_lists#warning', as: :warning

  scope "(:locale)", locale: /en|es|pl/ do

    # Static Pages
    get 'home', to: "pages#home", as: :home
    get 'network', to: "pages#network", as: :network
    get 'faqs', to: "pages#faqs", as: :faqs
    get 'team', to: "pages#team", as: :team
    get 'learn', to: "pages#learn", as: :learn
    get 'research', to: "pages#research", as: :research
    get 'share', to: "pages#share", as: :share
    get 'privacy-policy', to: "pages#privacy_policy", as: :privacy_policy
    get 'thank-you', to: "pages#thank_you", as: :thank_you
    get 'version', to: 'pages#version', as: :version
    get 'splash', to: 'pages#splash', as: :splash

    get 'questions/frequencies(/:question_id/:answer_session_id)', to: "questions#frequencies", as: :question_frequencies, format: :json
    get 'daily_trends', to: "questions#daily_trends", as: :daily_trends, format: :json

    get 'dashboard', to: "patient#dashboard", as: :dashboard
    get 'switch_theme/:theme', to: 'users#switch_theme', as: :switch_theme

    # Answer Sessions
    get 'survey/:question_flow_id', to: 'answer_sessions#start', as: :start_answer_session
    get 'survey/:answer_session_id/review', to: 'answer_sessions#finish', as: :finished_answer_session

    get 'survey/:answer_session_id/:question_id', to: 'answer_sessions#ask_question', as: :ask_question
    match 'survey', to: 'answer_sessions#process_answer', via: :post, as: :process_answer

    match 'vote', to: 'votes#vote', via: :post, as: :vote
    match 'add_to_rl', to: 'questions#add_to_research_list', via: :post, as: :add_to_rl
    match 'add_daily_trend', to: "answers#add_daily_trend", via: :post, as: :add_daily_trend

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

  root 'pages#home'


end
