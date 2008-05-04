class MailListController < ApplicationController
  before_filter :gc_required

	def index



	end

	def generate_list

		@graduate_applicants = GraduateApplicant.find(:all, :conditions => {:applicant_status_id => params[:graduate_applicant][:applicant_status_id]})

        for graduate_applicant in @graduate_applicants
          @text_status = ApplicantStatus.find(graduate_applicant.applicant_status_id).status
        end


	end

end
