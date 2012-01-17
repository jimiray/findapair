Findapair::Application.routes.draw do

  devise_for :users

  get 'github_authorizations/new', to: 'github_authorizations#new'
  get '/github_authorizations', to: 'github_authorizations#create', as: 'github_authorizations'

  get "~:id", :to => "users#show", :as => "user"
  get ":city", :to => "users#index", :as => "city"
  root :to => "home#index"

end
