ActionController::Routing::Routes.draw do |map|
	map.home '', :controller =>'home', :action => 'index' # Set Root To The Home Controller

	map.resources :graduate_applicants
	map.resources :departments
	
	#User Autentication Routes	
	map.resources :users
	map.resource :session, :controller => 'session'
	map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
	map.signup '/signup', :controller => 'users', :action => 'new'
	map.login '/login', :controller => 'session', :action => 'new'
	map.logout '/logout', :controller => 'session', :action => 'destroy'
	#End User Autentication Routes
end
