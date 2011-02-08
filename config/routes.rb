Findapair::Application.routes.draw do

  devise_for :users

  get "~:id", :to => "users#show", :as => "user"

  root :to => "home#index"

end
