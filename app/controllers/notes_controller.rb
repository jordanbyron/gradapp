class NotesController < ApplicationController
  before_filter :gc_required

def create
  @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
  @note = @graduate_applicant.notes.build(params[:note])

  respond_to do |format|
    if @note.save
      #flash[:notice] = 'Note was successfully created.'
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
  @note = @graduate_applicant.notes.find(params[:id]) 
  
  @note.destroy

  respond_to do |format|
    #flash[:notice] = 'Note was successfully deleted.'
    format.html { redirect_to @graduate_applicant }
    format.js # renders destroy.js.rjs
  end
end
end
