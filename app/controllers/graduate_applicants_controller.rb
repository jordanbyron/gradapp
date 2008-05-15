class GraduateApplicantsController < ApplicationController
  before_filter :gc_required
  
  # GET /graduate_applicants
  # GET /graduate_applicants.xml
  def index
    @graduate_applicants = GraduateApplicant.search(params[:search], params[:page],current_user.department_id)
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @graduate_applicants }
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
    
    #Capitalize First and Last Names
    @graduate_applicant.first_name = @graduate_applicant.first_name.capitalize
    @graduate_applicant.last_name = @graduate_applicant.last_name.capitalize

    add_application_requirements

    add_degree_requirements

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
 
  
end
