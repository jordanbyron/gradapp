class MailListController < ApplicationController

	def index
	
			
		
	end
	
	def generate_list
		
		@graduate_applicants = GraduateApplicant.find(:all)
		#params[:applicant_status_id]
		
	end

end
