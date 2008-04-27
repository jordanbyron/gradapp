class ApplicationRequirementsController < ApplicationController
   before_filter :gc_required
  
  # GET /application_requirements
  # GET /application_requirements.xml
  def index
    @department = Department.find(params[:department_id])
    @application_requirements = ApplicationRequirement.search(params[:search], params[:page],params[:department_id])
    @new_requirement = ApplicationRequirement.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @application_requirements }
    end
  end

  def toggle_new_requirement
    respond_to do |format|
      format.html { redirect_to @application_requirement }
      format.js # renders toggle_new_requirement.js.rjs
    end
  end

  # GET /application_requirements/1
  # GET /application_requirements/1.xml
  def show
    @application_requirement = ApplicationRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @application_requirement }
    end
  end

  # GET /application_requirements/new
  # GET /application_requirements/new.xml
  def new
    @department = Department.find(params[:department_id])
    @application_requirement = ApplicationRequirement.new

    flash[:department_id] = @department.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @application_requirement }
    end
  end

  # GET /application_requirements/1/edit
  def edit
    @department = Department.find(params[:department_id])
    @application_requirement = ApplicationRequirement.find(params[:id])
  end

  # POST /application_requirements
  # POST /application_requirements.xml
  def create
    @department = Department.find(params[:department_id]) #flash[:department_id])
    @application_requirement = ApplicationRequirement.new(params[:application_requirement])
    @application_requirement.department_id = @department.id

    respond_to do |format|
      if @application_requirement.save
        flash[:notice] = 'Application Requirement was successfully created.'
        flash[:new_req_div] = true
        format.html { redirect_to department_application_requirements_path(@department) }
        format.xml  { render :xml => @application_requirement, :status => :created, :location => @application_requirement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @application_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /application_requirements/1
  # PUT /application_requirements/1.xml
  def update
    @application_requirement = ApplicationRequirement.find(params[:id])
    @department = Department.find(@application_requirement.department_id)

    respond_to do |format|
      if @application_requirement.update_attributes(params[:application_requirement])
        flash[:notice] = 'Application Requirement was successfully updated.'
        format.html { redirect_to department_application_requirements_path(@department) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @application_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /application_requirements/1
  # DELETE /application_requirements/1.xml
  def destroy
    @application_requirement = ApplicationRequirement.find(params[:id])
    @department = Department.find(@application_requirement.department_id)

    @application_requirement.destroy

    respond_to do |format|
      flash[:notice] = 'Application Requirement was successfully removed.'
      format.html { redirect_to department_application_requirements_path(@department) }
      format.xml  { head :ok }
    end
  end
end
