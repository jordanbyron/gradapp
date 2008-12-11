class MailListController < ApplicationController
  before_filter :gc_required

	def index



	end

	def generate_list

		@graduate_applicants = GraduateApplicant.find(:all, :conditions => {:department_status_id => params[:graduate_applicant][:department_status_id]})

        for graduate_applicant in @graduate_applicants
          @text_status = graduate_applicant.department_status.status
        end


	end

end
