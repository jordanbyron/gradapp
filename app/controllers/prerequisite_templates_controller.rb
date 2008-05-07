class PrerequisiteTemplatesController < ApplicationController
  before_filter :gc_required
  
  # GET /prerequisite_templates
  # GET /prerequisite_templates.xml
  def index
    @prerequisite_templates = PrerequisiteTemplate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prerequisite_templates }
    end
  end

  # GET /prerequisite_templates/1
  # GET /prerequisite_templates/1.xml
  def show
    @prerequisite_template = PrerequisiteTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prerequisite_template }
    end
  end

  # GET /prerequisite_templates/new
  # GET /prerequisite_templates/new.xml
  def new
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @prerequisite_template = PrerequisiteTemplate.new
    
    flash[:degree_program_id] = @degree_program.id
    flash[:department_id] = @department.id
    flash[:ppos_template_id] = @ppos_template.id


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prerequisite_template }
    end
  end

  # GET /prerequisite_templates/1/edit
  def edit
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @prerequisite_template = PrerequisiteTemplate.find(params[:id])
  end

  # POST /prerequisite_templates
  # POST /prerequisite_templates.xml
  def create
    @prerequisite_template = PrerequisiteTemplate.new(params[:prerequisite_template])
    @prerequisite_template.ppos_template_id = flash[:ppos_template_id]

    respond_to do |format|
      if @prerequisite_template.save
        if params[:commit] == "Create and Add Another Prerequisite"
          flash[:notice] = 'Prerequisite Template was successfully created.'
          format.html { redirect_to new_prerequisite_template_path(flash[:department_id], flash[:degree_program_id], flash[:ppos_template_id]) }
        else
          format.html { redirect_to ppos_template_path(flash[:department_id], flash[:degree_program_id], flash[:ppos_template_id]) }
          format.xml  { render :xml => @prerequisite_template, :status => :created, :location => @prerequisite_template }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prerequisite_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prerequisite_templates/1
  # PUT /prerequisite_templates/1.xml
  def update
    @prerequisite_template = PrerequisiteTemplate.find(params[:id])

    respond_to do |format|
      if @prerequisite_template.update_attributes(params[:prerequisite_template])
        #flash[:notice] = 'PrerequisiteTemplate was successfully updated.'
        format.html { redirect_to ppos_template_path(params[:department_id], params[:degree_program_id], params[:ppos_template_id]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prerequisite_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prerequisite_templates/1
  # DELETE /prerequisite_templates/1.xml
  def destroy
    @prerequisite_template = PrerequisiteTemplate.find(params[:id])
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @prerequisite_template.destroy

    if (request.xhr?)
      render :partial => 'ppos_templates/prerequisite_template',
               :locals  => {:prerequisite_templates => @ppos_template.prerequisite_templates,
                            :ppos_template    => @ppos_template,
                            :degree_program   => @degree_program,
                            :department       => @department}
    else
      respond_to do |format|
        format.html { redirect_to ppos_template_path(params[:department_id], params[:degree_program_id], params[:ppos_template_id]) }
        format.xml  { head :ok }
      end
    end
  end
end
