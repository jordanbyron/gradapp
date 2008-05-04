class HeaderTemplatesController < ApplicationController
  before_filter :gc_required
  
  # GET /header_templates
  # GET /header_templates.xml
  def index
    @header_templates = HeaderTemplate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @header_templates }
    end
  end

  # GET /header_templates/1
  # GET /header_templates/1.xml
  def show
    @header_template = HeaderTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @header_template }
    end
  end

  # GET /header_templates/new
  # GET /header_templates/new.xml
  def new
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @header_template = HeaderTemplate.new
    
    flash[:degree_program_id] = @degree_program.id
    flash[:department_id] = @department.id
    flash[:ppos_template_id] = @ppos_template.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @header_template }
    end
  end

  # GET /header_templates/1/edit
  def edit
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @header_template = HeaderTemplate.find(params[:id])
  end

  # POST /header_templates
  # POST /header_templates.xml
  def create
    @header_template = HeaderTemplate.new(params[:header_template])
    @header_template.ppos_template_id = flash[:ppos_template_id]
    
    respond_to do |format|
      if @header_template.save
        #flash[:notice] = 'HeaderTemplate was successfully created.'
        
        if params[:commit] == "Create and Add Courses to Header"
          flash[:notice] = 'Header was successfully created.'
          format.html { redirect_to new_course_template_path(flash[:department_id], flash[:degree_program_id], flash[:ppos_template_id],  @header_template.id) } 
        else
          format.html { redirect_to ppos_template_path(flash[:department_id], flash[:degree_program_id], flash[:ppos_template_id]) }
          format.xml  { render :xml => @header_template, :status => :created, :location => @header_template }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @header_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /header_templates/1
  # PUT /header_templates/1.xml
  def update
    @header_template = HeaderTemplate.find(params[:id])

    respond_to do |format|
      if @header_template.update_attributes(params[:header_template])
        flash[:notice] = 'Header was successfully updated.'
        format.html { redirect_to ppos_template_path(params[:department_id], params[:degree_program_id], params[:ppos_template_id]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @header_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /header_templates/1
  # DELETE /header_templates/1.xml
  def destroy
    @header_template = HeaderTemplate.find(params[:id])
    @header_template.destroy

    respond_to do |format|
      format.html { redirect_to ppos_template_path(params[:department_id], params[:degree_program_id], params[:ppos_template_id]) }
      format.xml  { head :ok }
    end
  end
end
