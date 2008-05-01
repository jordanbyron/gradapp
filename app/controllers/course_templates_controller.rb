class CourseTemplatesController < ApplicationController
  # GET /course_templates
  # GET /course_templates.xml
  def index
    @course_templates = CourseTemplate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @course_templates }
    end
  end

  # GET /course_templates/1
  # GET /course_templates/1.xml
  def show
    @course_template = CourseTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @course_template }
    end
  end

  # GET /course_templates/new
  # GET /course_templates/new.xml
  def new
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @course_template = CourseTemplate.new

    flash[:degree_program_id] = @degree_program.id
    flash[:department_id] = @department.id
    flash[:ppos_template_id] = @ppos_template.id
    flash[:header_template_id] = params[:header_template_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_template }
    end
  end

  # GET /course_templates/1/edit
  def edit
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @header_template = HeaderTemplate.find(params[:header_template_id])

    @course_template = CourseTemplate.find(params[:id])

    flash[:degree_program_id] = @degree_program.id
    flash[:department_id] = @department.id
    flash[:ppos_template_id] = @ppos_template.id
  end

  # POST /course_templates
  # POST /course_templates.xml
  def create
    @course_template = CourseTemplate.new(params[:course_template])
    @course_template.header_template_id =  flash[:header_template_id]

    respond_to do |format|
      if @course_template.save
        #flash[:notice] = 'CourseTemplate was successfully created.'
        format.html { redirect_to ppos_template_path(flash[:department_id], flash[:degree_program_id], flash[:ppos_template_id]) }
        format.xml  { render :xml => @course_template, :status => :created, :location => @course_template }
      else

        @degree_program = DegreeProgram.find(flash[:degree_program_id])
        @department = Department.find(flash[:department_id])
        @ppos_template = PposTemplate.find(flash[:ppos_template_id])

        flash[:degree_program_id] = @degree_program.id
        flash[:department_id] = @department.id
        flash[:ppos_template_id] = @ppos_template.id
        flash[:header_template_id] = params[:header_template_id]

        format.html { render :action => "new" }
        format.xml  { render :xml => @course_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /course_templates/1
  # PUT /course_templates/1.xml
  def update
    @course_template = CourseTemplate.find(params[:id])

    respond_to do |format|
      if @course_template.update_attributes(params[:course_template])
        flash[:notice] = 'Course was successfully updated.'
        format.html { redirect_to ppos_template_path(params[:department_id], params[:degree_program_id], params[:ppos_template_id]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_templates/1
  # DELETE /course_templates/1.xml
  def destroy
    @course_template = CourseTemplate.find(params[:id])
    @course_template.destroy

    respond_to do |format|
      format.html { redirect_to ppos_template_path(params[:department_id], params[:degree_program_id], params[:ppos_template_id])  }
      format.xml  { head :ok }
    end
  end
end
