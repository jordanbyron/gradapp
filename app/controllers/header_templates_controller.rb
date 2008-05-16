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
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @header_template = @ppos_template.header_templates.build()

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @header_template }
    end
  end

  # GET /header_templates/1/edit
  def edit
    @header_template = HeaderTemplate.find(params[:id])
  end

  # POST /header_templates
  # POST /header_templates.xml
  def create
    @header_template = HeaderTemplate.new(params[:header_template])
    
    respond_to do |format|
      if @header_template.save       
        if params[:commit] == "Create and Add Courses to Header"
          flash[:notice] = 'Header was successfully created.'
          format.html { redirect_to new_course_template_path(@header_template.ppos_template.degree_program.department, @header_template.ppos_template.degree_program, @header_template.ppos_template,  @header_template.id) } 
        else
          format.html { redirect_to ppos_template_path(@header_template.ppos_template.degree_program.department, @header_template.ppos_template.degree_program, @header_template.ppos_template) }
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
        format.html { redirect_to ppos_template_path(@header_template.ppos_template.degree_program.department, @header_template.ppos_template.degree_program, @header_template.ppos_template) }
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
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @header_template = HeaderTemplate.find(params[:id])
    @header_template.destroy
    
    if (request.xhr?)
      render :partial => 'ppos_templates/header_template',
              :locals  => {:header_templates => @ppos_template.header_templates,
                      :ppos_template    => @ppos_template,
                      :degree_program   => @degree_program,
                      :department       => @department }
    else
      respond_to do |format|
        format.html { redirect_to ppos_template_path(params[:department_id], params[:degree_program_id], params[:ppos_template_id]) }
        format.xml  { head :ok }
      end
    end
  end
end
