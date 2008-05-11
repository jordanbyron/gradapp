class DegreeProgramsController < ApplicationController
  before_filter :gc_required

  # GET /degree_programs
  # GET /degree_programs.xml
  def index
    @department = Department.find(params[:department_id])
    @degree_programs = DegreeProgram.search(params[:search], params[:page],params[:department_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @degree_programs }
    end
  end
  
  # GET /degree_programs
  # GET /degree_programs.xml
  def ppos_list
    @department = Department.find(params[:department_id])
    @degree_programs = DegreeProgram.search(params[:search], params[:page],params[:department_id])

    respond_to do |format|
      format.html # ppos_list.html.erb
      format.xml  { render :xml => @degree_programs }
    end
  end

  # GET /degree_programs/1
  # GET /degree_programs/1.xml
  def show
    @degree_program = DegreeProgram.find(params[:id])
    @department = Department.find(@degree_program.department.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @degree_program }
    end
  end

  # GET /degree_programs/new
  # GET /degree_programs/new.xml
  def new
    @department = Department.find(params[:department_id])
    @degree_program = DegreeProgram.new
    
    flash[:department_id] = @department.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @degree_program }
    end
  end

  # GET /degree_programs/1/edit
  def edit
    @department = Department.find(params[:department_id])
    @degree_program = DegreeProgram.find(params[:id])
    
    flash[:department_id] = @department.id
  end

  # POST /degree_programs
  # POST /degree_programs.xml
  def create
    @degree_program = DegreeProgram.new(params[:degree_program])
    
    respond_to do |format|
      if @degree_program.save
      
        # Create PPoS
        @ppos_template = PposTemplate.new
        @ppos_template.degree_program_id = @degree_program.id
        @ppos_template.concentrations = 0
        @ppos_template.save
      
        flash[:notice] = 'Degree Program was successfully created.'
        format.html { redirect_to department_degree_programs_path(@degree_program.department_id) }
        format.xml  { render :xml => @degree_program, :status => :created, :location => @degree_program }
      else
        @department = Department.find(params[:department_id])
        
        format.html { render :action => "new" }
        format.xml  { render :xml => @degree_program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /degree_programs/1
  # PUT /degree_programs/1.xml
  def update
    @degree_program = DegreeProgram.find(params[:id])
    @department = Department.find(@degree_program.department.id)

    respond_to do |format|
      if @degree_program.update_attributes(params[:degree_program])
        flash[:notice] = 'Degree Program was successfully updated.'
        format.html { redirect_to department_degree_program_path(@department,@degee_program) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @degree_program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /degree_programs/1
  # DELETE /degree_programs/1.xml
  def destroy
    @degree_program = DegreeProgram.find(params[:id])
    @department = Department.find(@degree_program.department.id)
    @degree_program.destroy

    respond_to do |format|
      flash[:notice] = 'Degree Program was successfully removed.'
      format.html { redirect_to department_degree_programs_path(@department) }
      format.xml  { head :ok }
    end
  end
end
