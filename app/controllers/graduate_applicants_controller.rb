class GraduateApplicantsController < ApplicationController
  before_filter :gc_required
  
  # GET /graduate_applicants
  # GET /graduate_applicants.xml
  def index
    if params[:commit] == "Clear"
      params[:search] = ""
      params[:status] = ""
      params[:degree_program] = ""
    end
    
    @graduate_applicants = GraduateApplicant.search(params[:search],params[:status],params[:degree_program], params[:page],current_user.pagination_pref,current_user.department_id)
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @graduate_applicants }
      format.pdf  {   @graduate_applicants = GraduateApplicant.find(:all, :conditions =>{ :department_id => current_user.department_id },:order => :last_name)
                      render :layout => false }
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
        format.pdf  { render :layout => false }
      end
    end
  end

  # GET /graduate_applicants/new
  # GET /graduate_applicants/new.xml
  def new
    @graduate_applicant = GraduateApplicant.new
    
    @graduate_applicant.country = "United States"     #Set US as default country. Sloppy, but it works

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
    
    #Capitalize First and Last Names
    @graduate_applicant.first_name = @graduate_applicant.first_name.capitalize
    @graduate_applicant.last_name = @graduate_applicant.last_name.capitalize

    add_application_requirements

    add_degree_requirements

    respond_to do |format|
      if @graduate_applicant.save
      
        clear_application_received_date
      
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
      
        clear_application_received_date
        
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
      flash[:notice] = 'Graduate Applicant was successfully deleted.'
      format.html { redirect_to(graduate_applicants_url) }
      format.xml  { head :ok }
    end
  end
  
  
 protected
  
  def add_application_requirements
    @graduate_applicant.degree_program.department.application_requirements.each do |r|
      @graduate_applicant.applicant_requirements.build(:requirement => r.description, 
                                                       :met => false)
    end                      
  end         

  def add_degree_requirements
    @graduate_applicant.degree_program.degree_requirements.each do |r|
      @graduate_applicant.applicant_requirements.build(:requirement => r.description, 
                                                       :met => false)
    end  
  end   
 
 def clear_application_received_date
    # Check to be sure the Application was received, otherwise clear the date
    if params[:application_received_by_graduate_office] != "on"
      @graduate_applicant.date_application_received_by_graduate_office = nil
      @graduate_applicant.save
    end
    
    if params[:application_received_by_department] != "on"
      @graduate_applicant.date_application_received_by_department = nil
      @graduate_applicant.save
    end
 end
  
end
