class PposTemplatesController < ApplicationController
  # GET /ppos_templates
  # GET /ppos_templates.xml
  def index
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @ppos_templates = PposTemplate.find(:all, :conditions => { :degree_program_id => @degree_program.id })

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ppos_templates }
    end
  end

  # GET /ppos_templates/1
  # GET /ppos_templates/1.xml
  def show
    @ppos_template = PposTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ppos_template }
    end
  end

  # GET /ppos_templates/new
  # GET /ppos_templates/new.xml
  def new
    @ppos_template = PposTemplate.new
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])

    flash[:degree_program_id] = @degree_program.id
    flash[:department_id] = @department.id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ppos_template }
    end
  end

  # GET /ppos_templates/1/edit
  def edit
    @ppos_template = PposTemplate.find(params[:id])
  end

  # POST /ppos_templates
  # POST /ppos_templates.xml
  def create
    @ppos_template = PposTemplate.new(params[:ppos_template])
    @ppos_template.degree_program_id = flash[:degree_program_id]

    respond_to do |format|
      if @ppos_template.save
        flash[:notice] = 'PposTemplate was successfully created.'
        format.html { redirect_to ppos_templates_path(flash[:department_id], flash[:degree_program_id]) }
        format.xml  { render :xml => @ppos_template, :status => :created, :location => @ppos_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ppos_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ppos_templates/1
  # PUT /ppos_templates/1.xml
  def update
    @ppos_template = PposTemplate.find(params[:id])

    respond_to do |format|
      if @ppos_template.update_attributes(params[:ppos_template])
        flash[:notice] = 'PposTemplate was successfully updated.'
        format.html { redirect_to(@ppos_template) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ppos_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ppos_templates/1
  # DELETE /ppos_templates/1.xml
  def destroy
    @ppos_template = PposTemplate.find(params[:id])
    @ppos_template.destroy

    respond_to do |format|
      format.html { redirect_to(ppos_templates_url) }
      format.xml  { head :ok }
    end
  end
end
