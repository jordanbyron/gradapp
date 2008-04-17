ActionController::Routing::Routes.draw do |map|
  map.resources :application_requirements

	map.home '', :controller =>'home', :action => 'index' # Set Root To The Home Controller

	map.resources :graduate_applicants
	map.resources :departments
  map.resources :setup
  	
	#User Autentication Routes	
	map.resources :users, :controller => 'users'
	map.resource :session, :controller => 'session'
	map.login '/login', :controller => 'session', :action => 'new'
	map.logout '/logout', :controller => 'session', :action => 'destroy'
	#End User Autentication Routes
end
