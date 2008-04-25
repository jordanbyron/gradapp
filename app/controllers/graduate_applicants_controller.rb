class GraduateApplicantsController < ApplicationController
  before_filter :gc_required

  def show_contact_info
    @graduate_applicant = GraduateApplicant.find(params[:id])
    
    render  :partial => 'contact_info',
            :locals  => {:graduate_applicant => @graduate_applicant}
  end

  def show_note_info
    @graduate_applicant = GraduateApplicant.find(params[:id])
    @note = Note.new
    
    render  :partial => 'note_info',
            :locals  => {:notes => @graduate_applicant.notes, 
                        :graduate_applicant => @graduate_applicant,
                        :note => @note}
  end
  
  def show_applicant_requirement_info
    @graduate_applicant = GraduateApplicant.find(params[:id])
    
    render  :partial => 'applicant_requirement_info',
            :locals  => {:graduate_applicant => @graduate_applicant}
  end
  
  def show_correspondence_info
    @graduate_applicant = GraduateApplicant.find(params[:id])
    @correspondence = Correspondence.new
    
    render  :partial => 'correspondence_info',
            :locals  => { :correspondences => @graduate_applicant.correspondences,
                          :graduate_applicant => @graduate_applicant,
                          :correspondence => @correspondence}
  end
  
  def show_ppos_info
    @graduate_applicant = GraduateApplicant.find(params[:id])
    
    render  :partial => 'ppos_info',
            :locals  => {:graduate_applicant => @graduate_applicant}
  end
  
  def toggle_new_note
    respond_to do |format|
      format.html { redirect_to @graduate_applicant }
      format.js # renders toggle_new_note.js.rjs
    end
  end
  
  # GET /graduate_applicants
  # GET /graduate_applicants.xml
  def index
    @graduate_applicants = GraduateApplicant.search(params[:search], params[:page],current_user.department_id)
	
    if request.xml_http_request?
      render :partial => "applicant_list", :layout => false
    else
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @graduate_applicants }
      end
    end
  end

  # GET /graduate_applicants/1
  # GET /graduate_applicants/1.xml
  def show
    @graduate_applicant = GraduateApplicant.find(params[:id])

    if gc_authorized(@graduate_applicant.department_id)  # Verify Current GC Is Authorized
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @graduate_applicant }
      end
    end
  end

  # GET /graduate_applicants/new
  # GET /graduate_applicants/new.xml
  def new
    @graduate_applicant = GraduateApplicant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @graduate_applicant }
    end
  end

  # GET /graduate_applicants/1/edit
  def edit
    @graduate_applicant = GraduateApplicant.find(params[:id])

    gc_authorized(@graduate_applicant.department_id)   # Verify Current GC Is Authorized
  end

  # POST /graduate_applicants
  # POST /graduate_applicants.xml
  def create
    @graduate_applicant = GraduateApplicant.new(params[:graduate_applicant])

    # Set Graduate Applicant Department To The Current User's Department
    @graduate_applicant.department_id = current_user.department_id

    respond_to do |format|
      if @graduate_applicant.save
        flash[:notice] = 'Graduate Applicant was successfully created.'
        format.html { redirect_to(@graduate_applicant) }
        format.xml  { render :xml => @graduate_applicant, :status => :created, :location => @graduate_applicant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @graduate_applicant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /graduate_applicants/1
  # PUT /graduate_applicants/1.xml
  def update
    @graduate_applicant = GraduateApplicant.find(params[:id])

    respond_to do |format|
      if @graduate_applicant.update_attributes(params[:graduate_applicant])
        flash[:notice] = 'Graduate Applicant was successfully updated.'
        format.html { redirect_to(@graduate_applicant) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @graduate_applicant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /graduate_applicants/1
  # DELETE /graduate_applicants/1.xml
  def destroy
    @graduate_applicant = GraduateApplicant.find(params[:id])

    gc_authorized(@graduate_applicant.department_id) # Verify Current GC Is Authorized

    @graduate_applicant.destroy

    respond_to do |format|
      format.html { redirect_to(graduate_applicants_url) }
      format.xml  { head :ok }
    end
  end
  
  
  #def list

    #items_per_page = 10

    #sort = case params['sort']
    #       when "name"  then "name"

           #end

    #conditions = ["name LIKE ?", "%#{params[:query]}%"] unless params[:query].nil?

    #@total = graduate_applicants.count(:conditions => conditions)
    #@items_pages, @items = paginate :graduate_applicant, :conditions => conditions, :per_page => items_per_page
#:order => sort, 
    #if request.xml_http_request?
    #  render :partial => "applicant_list", :layout => false
    #end

  #end
  
  
  
end
