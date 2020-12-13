Rails.application.routes.draw do
  devise_for :users
  resources :articles
  resources :projects

  get "/welcome", to: "welcome#index"

  root 'welcome#index'
end
