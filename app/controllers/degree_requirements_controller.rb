class DegreeRequirementsController < ApplicationController
  before_filter :gc_required
  
  # GET /degree_requirements
  # GET /degree_requirements.xml
  def index
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @degree_requirements = DegreeRequirement.search(params[:search], params[:page],params[:degree_program_id])
    @new_requirement = DegreeRequirement.new
    @new_requirement.degree_program_id = @degree_program.id

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @degree_requirements }
    end
  end

  # GET /degree_requirements/1
  # GET /degree_requirements/1.xml
  def show
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @degree_requirement = DegreeRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @degree_requirement }
    end
  end

  # GET /degree_requirements/new
  # GET /degree_requirements/new.xml
  def new
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @degree_requirement = DegreeRequirement.new
    
    flash[:degree_program_id] = @degree_program.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @degree_requirement }
    end
  end

  # GET /degree_requirements/1/edit
  def edit
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @degree_requirement = DegreeRequirement.find(params[:id])
  end

  # POST /degree_requirements
  # POST /degree_requirements.xml
  def create
    @degree_requirement = DegreeRequirement.new(params[:degree_requirement])
    
    respond_to do |format|
      if @degree_requirement.save
        flash[:notice] = 'Degree Requirement was successfully created.'
        flash[:new_req_div] = true
        format.html { redirect_to degree_requirements_path(@degree_requirement.degree_program.department_id, @degree_requirement.degree_program.id) }
        format.xml  { render :xml => @degree_requirement, :status => :created, :location => @degree_requirement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @degree_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /degree_requirements/1
  # PUT /degree_requirements/1.xml
  def update
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @degree_requirement = DegreeRequirement.find(params[:id])

    respond_to do |format|
      if @degree_requirement.update_attributes(params[:degree_requirement])
        flash[:notice] = 'Degree Requirement was successfully updated.'
        format.html { redirect_to degree_requirements_path(@degree_program.department_id, @degree_program.id)  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @degree_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /degree_requirements/1
  # DELETE /degree_requirements/1.xml
  def destroy
    @degree_requirement = DegreeRequirement.find(params[:id])
    @degree_requirement.destroy

    respond_to do |format|
      format.html { redirect_to(degree_requirements_url) }
      format.xml  { head :ok }
    end
  end
end
