ActionController::Routing::Routes.draw do |map|
	map.home '', :controller =>'home', :action => 'index' # Set Root To The Home Controller

  map.resources :correspondences
  map.resources :correspondence_templates
  map.resources :degree_programs
  map.resources :correspondences
  map.resources :notes
  map.resources :applicant_requirements
  map.resources :application_requirements
	map.resources :graduate_applicants
  map.resources :graduate_applicants, :has_many => :correspondences
  map.resources :graduate_applicants, :has_many => :notes
	map.resources :departments
  map.resources :setup
  
  map.templates '/templates', :controller => 'template', :action => 'index'
  	
	#User Autentication Routes	
	map.resources :users, :controller => 'users'
	map.resource :session, :controller => 'session'
	map.login '/login', :controller => 'session', :action => 'new'
	map.logout '/logout', :controller => 'session', :action => 'destroy'
	#End User Autentication Routes
  
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
