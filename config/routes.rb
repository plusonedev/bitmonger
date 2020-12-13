Rails.application.routes.draw do
  devise_for :users
  get "/articles", to: "articles#index"
  get "/welcome", to: "welcome#index"

  root 'welcome#index'
end
