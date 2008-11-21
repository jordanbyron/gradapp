class NotesController < ApplicationController
  before_filter :gc_required

  def index
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @notes = Note.search(params[:search], params[:page],current_user.pagination_pref,params[:graduate_applicant_id])
    @new_note = Note.new 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
    end
  end

  def edit
    @note = Note.find(params[:id])
    @graduate_applicant = GraduateApplicant.find(@note.graduate_applicant_id)
  end

  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        flash[:notice] = 'Note was successfully updated.'
        format.html { redirect_to graduate_applicant_notes_path(@note.graduate_applicant_id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @header_template.errors, :status => :unprocessable_entity }
      end
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
    @note.created_by = current_user.full_name

    respond_to do |format|
      if @note.save
        flash[:notice] = 'Note was successfully created.'
        flash[:new_note_div] = true
        format.html { redirect_to graduate_applicant_notes_path(@graduate_applicant) }
      else
        format.html { redirect_to graduate_applicant_notes_path(@graduate_applicant) }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id]) 
    @graduate_applicant = GraduateApplicant.find(@note.graduate_applicant_id)
    
    @note.destroy

    respond_to do |format|
      flash[:notice] = 'Note was successfully deleted.'
      format.html { redirect_to graduate_applicant_notes_path(@graduate_applicant) }
    end
  end
end
