ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'login', :action => 'index'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
