class ApplicantRequirementsController < ApplicationController
  # GET /applicant_requirements
  # GET /applicant_requirements.xml
  def index
    @applicant_requirements = ApplicantRequirement.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @applicant_requirements }
    end
  end

  # GET /applicant_requirements/1
  # GET /applicant_requirements/1.xml
  def show
    @applicant_requirement = ApplicantRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @applicant_requirement }
    end
  end

  # GET /applicant_requirements/new
  # GET /applicant_requirements/new.xml
  def new
    @applicant_requirement = ApplicantRequirement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @applicant_requirement }
    end
  end

  # GET /applicant_requirements/1/edit
  def edit
    @applicant_requirement = ApplicantRequirement.find(params[:id])
  end

  # POST /applicant_requirements
  # POST /applicant_requirements.xml
  def create
    @applicant_requirement = ApplicantRequirement.new(params[:applicant_requirement])

    respond_to do |format|
      if @applicant_requirement.save
        flash[:notice] = 'ApplicantRequirement was successfully created.'
        format.html { redirect_to(@applicant_requirement) }
        format.xml  { render :xml => @applicant_requirement, :status => :created, :location => @applicant_requirement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @applicant_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /applicant_requirements/1
  # PUT /applicant_requirements/1.xml
  def update
    @applicant_requirement = ApplicantRequirement.find(params[:id])

    respond_to do |format|
      if @applicant_requirement.update_attributes(params[:applicant_requirement])
        flash[:notice] = 'ApplicantRequirement was successfully updated.'
        format.html { redirect_to(@applicant_requirement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @applicant_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_requirements/1
  # DELETE /applicant_requirements/1.xml
  def destroy
    @applicant_requirement = ApplicantRequirement.find(params[:id])
    @applicant_requirement.destroy

    respond_to do |format|
      format.html { redirect_to(applicant_requirements_url) }
      format.xml  { head :ok }
    end
  end
end
