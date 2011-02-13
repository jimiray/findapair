Findapair::Application.routes.draw do

  devise_for :users

  get "~:id", :to => "users#show", :as => "user"
  get ":city", :to => "users#index", :as => "city"
  root :to => "home#index"

end
