# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "law_proposals#index"
  post "/vote", to: "votes#vote"
  resources :law_proposals

  get "/signup", to: "registrations#new", as: :signup_form
  post "/signup", to: "registrations#create", as: :signup
  get "/login", to: "sessions#new", as: :login_form
  post "/login", to: "sessions#create", as: :login
  delete "/logout", to: "sessions#destroy", as: :logout

  namespace :admin do
    resources :law_proposals
  end
end
