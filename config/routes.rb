ActionController::Routing::Routes.draw do |map|

  map.resources :users
  map.resources :lendings
  map.resource :user_session

  map.register '/register', :controller => "users", :action => "new"
  map.login '/login', :controller => "user_sessions", :action => "new"

  map.root :controller => "lendings", :action => "index"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
