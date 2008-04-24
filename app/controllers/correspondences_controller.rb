class CorrespondencesController < ApplicationController
  before_filter :gc_required

def create
  @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
  @correspondence = @graduate_applicant.correspondences.build(params[:correspondence])

  respond_to do |format|
    if @correspondence.save
      #flash[:notice] = 'Correspondence was successfully created.'
      format.html { redirect_to @graduate_applicant }
      format.js # renders create.js.rjs
    else
      format.html { redirect_to @graduate_applicant }
      format.js do
        render :update do |page| 
          page.redirect_to @graduate_applicant 
        end
      end
    end
  end
end

def destroy
  @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
  @correspondence = @graduate_applicant.correspondences.find(params[:id]) 
  
  @correspondence.destroy

  respond_to do |format|
    #flash[:notice] = 'Note was successfully deleted.'
    format.html { redirect_to @graduate_applicant }
    format.js # renders destroy.js.rjs
  end
end
  
end
