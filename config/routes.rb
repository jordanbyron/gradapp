ActionController::Routing::Routes.draw do |map|

  # Home Controller
  map.home '', :controller =>'home', :action => 'index' # Set Root To The Home Controller
  map.about '/about', :controller => 'home', :action => 'about' # Set about path
  
  map.resources :support_requests
  map.resources :course_templates, :path_prefix => '/departments/:department_id/degree_programs/:degree_program_id/ppos_templates/:ppos_template_id/header_templates/:header_template_id'
  map.resources :header_templates, :path_prefix => '/departments/:department_id/degree_programs/:degree_program_id/ppos_templates/:ppos_template_id'
  map.resources :prerequisite_templates, :path_prefix => '/departments/:department_id/degree_programs/:degree_program_id/ppos_templates/:ppos_template_id'
  map.resources :ppos_templates, :path_prefix => '/departments/:department_id/degree_programs/:degree_program_id'
  map.resources :department_statuses, :path_prefix => '/departments/:department_id'
  map.resources :department_statuses, :has_many => :graduate_applicants
  map.resources :department_statuses
  map.resources :applicant_statuses, :has_many => :department_statuses
  map.resources :correspondences
  map.resources :correspondence_templates
  map.resources :degree_requirements, :path_prefix => '/departments/:department_id/degree_programs/:degree_program_id'
  map.resources :degree_programs
  map.resources :correspondences
  map.resources :attachments
  map.resources :notes
  map.resources :applicant_requirements, :path_prefix => '/graduate_applicants/:graduate_applicant_id'
  map.resources :announcements
  map.resources :application_requirements
  map.resources :graduate_applicants
  map.resources :graduate_applicants, :has_many => :correspondences
  map.resources :graduate_applicants, :has_many => :notes
  map.resources :graduate_applicants, :has_many => :attachments
  map.resources :mail_list
  map.resources :linkbox
  map.resources :departments
  map.resources :departments, :has_many => :application_requirements
  map.resources :departments, :has_many => :department_statuses
  map.resources :departments, :has_many => :degree_programs
  map.resources :setup
  map.resources :ppos_prerequisites
  map.resources :ppos_courses
  map.resources :ppos_headers
  map.resources :ppos, :path_prefix => '/graduate_applicants/:graduate_applicant_id'
  map.connect '/graduate_applicants/:graduate_applicant_id/ppos/:ppos_id/print', :controller => 'ppos', :action => 'print'
  map.connect '/graduate_applicants/:graduate_applicant_id/correspondences/:correspondence_id/print', :controller => 'correspondences', :action => 'print'

  map.ppos_template_list 'departments/:department_id/degree_programs_ppos/', :controller => 'degree_programs', :action => 'ppos_list'

  #Support Path
  map.support '/support', :controller => 'support_requests', :action => 'new'
  map.support_thank_you '/support/thank_you', :controller => 'support_requests', :action => 'thank_you'

	#User Autentication Routes
	map.resources :users, :controller => 'users'
	map.resource :session, :controller => 'session'
	map.login '/login', :controller => 'session', :action => 'new'
	map.logout '/logout', :controller => 'session', :action => 'destroy'
  map.change_password '/change_password/:user_id', :controller => 'users', :action => 'change_password'
	#End User Autentication Routes

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action.:format'
  map.connect ':controller/:action/:id.:format'
end
