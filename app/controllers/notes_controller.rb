class NotesController < ApplicationController
  before_filter :gc_required

  def index
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @notes = Note.search(params[:search], params[:page],params[:graduate_applicant_id])
    @note = Note.new 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
    end
  end

  def toggle_new_note
    respond_to do |format|
      format.html { redirect_to @graduate_applicant }
      format.js # renders toggle_new_note.js.rjs
    end
  end

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
