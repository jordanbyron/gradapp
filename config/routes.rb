ActionController::Routing::Routes.draw do |map|
  map.home '', :controller =>'home', :action => 'index' # Set Root To The Home Controller

  map.resources :course_templates
  map.resources :header_templates
  map.resources :prerequisite_templates
  map.resources :consentrations_templates
  map.resources :ppos_templates, :path_prefix => '/departments/:department_id/degree_programs/:degree_program_id'
  map.resources :applicant_statuses, :has_many => :graduate_applicants
  map.resources :correspondences
  map.resources :correspondence_templates
  map.resources :degree_requirements, :path_prefix => '/departments/:department_id/degree_programs/:degree_program_id'
  map.resources :degree_programs
  map.resources :correspondences
  map.resources :notes
  map.resources :applicant_requirements
  map.resources :application_requirements
  map.resources :graduate_applicants
  map.resources :graduate_applicants, :has_many => :correspondences
  map.resources :graduate_applicants, :has_many => :notes
  map.resources :departments
  map.resources :departments, :has_many => :application_requirements
  map.resources :departments, :has_many => :degree_programs
  map.resources :setup

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
