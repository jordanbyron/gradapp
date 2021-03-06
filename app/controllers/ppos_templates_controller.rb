class PposTemplatesController < ApplicationController
  before_filter :gc_required
  
  # GET /ppos_templates
  # GET /ppos_templates.xml
  def index
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
    @ppos_template = PposTemplate.find(:first, :conditions => { :degree_program_id => @degree_program.id })

    if @ppos_template != nil
      respond_to do |format|
        format.html { redirect_to ppos_template_path(@department.id, @degree_program.id,@ppos_template.id) }
      end
    else
      respond_to do |format|
        format.html { redirect_to new_ppos_template_path(@department.id, @degree_program.id) }
      end
    end
  end

  # GET /ppos_templates/1
  # GET /ppos_templates/1.xml
  def show
    @degree_program = DegreeProgram.find(params[:degree_program_id])
    @department = Department.find(params[:department_id])
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
        #flash[:notice] = 'PposTemplate was successfully created.'
        format.html { redirect_to ppos_template_path(flash[:department_id], flash[:degree_program_id],@ppos_template.id) }
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
        #flash[:notice] = 'PposTemplate was successfully updated.'
        format.html { redirect_to ppos_template_path(params[:department_id], params[:degree_program_id],@ppos_template.id) }
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
  
  # PPoS Screen Stuff
  
  def move_prerequisite_up
    @prerequisite_template = PrerequisiteTemplate.find(params[:prerequisite_template_id])
    @prerequisite_template.move_higher
    
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @degree_program = DegreeProgram.find(@ppos_template.degree_program_id)
    @department = Department.find(@degree_program.department_id)
    
    respond_to do |format|
      format.html { render :partial => 'prerequisite_template',
               :locals  => {:prerequisite_templates => @ppos_template.prerequisite_templates,
                            :ppos_template    => @ppos_template,
                            :degree_program   => @degree_program,
                            :department       => @department} }
    end
  end
  
  def move_prerequisite_down
    @prerequisite_template = PrerequisiteTemplate.find(params[:prerequisite_template_id])
    @prerequisite_template.move_lower
    
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @degree_program = DegreeProgram.find(@ppos_template.degree_program_id)
    @department = Department.find(@degree_program.department_id)
    
    respond_to do |format|
      format.html { render :partial => 'prerequisite_template',
               :locals  => {:prerequisite_templates => @ppos_template.prerequisite_templates,
                            :ppos_template    => @ppos_template,
                            :degree_program   => @degree_program,
                            :department       => @department} }
    end
  end
  
  def move_header_up
    @header_template = HeaderTemplate.find(params[:header_template_id])
    @header_template.move_higher
    
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @degree_program = DegreeProgram.find(@ppos_template.degree_program_id)
    @department = Department.find(@degree_program.department_id)
    
    respond_to do |format|
      format.html { render :partial => 'header_template',
                    :locals  => {:header_templates => @ppos_template.header_templates,
                            :ppos_template    => @ppos_template,
                            :degree_program   => @degree_program,
                            :department       => @department } }
    end
  end
  
  def move_header_down
    @header_template = HeaderTemplate.find(params[:header_template_id])
    @header_template.move_lower
    
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @degree_program = DegreeProgram.find(@ppos_template.degree_program_id)
    @department = Department.find(@degree_program.department_id)
    
    respond_to do |format|
      format.html { render :partial => 'header_template',
                    :locals  => {:header_templates => @ppos_template.header_templates,
                            :ppos_template    => @ppos_template,
                            :degree_program   => @degree_program,
                            :department       => @department } }
    end
  end
  
  def move_course_up
    @course_template = CourseTemplate.find(params[:course_template_id])
    @course_template.move_higher
    
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @degree_program = DegreeProgram.find(@ppos_template.degree_program_id)
    @department = Department.find(@degree_program.department_id)
    
    respond_to do |format|
      format.html { render :partial => 'header_template',
                    :locals  => {:header_templates => @ppos_template.header_templates,
                            :ppos_template    => @ppos_template,
                            :degree_program   => @degree_program,
                            :department       => @department } }
    end
  end
  
  def move_course_down
    @course_template = CourseTemplate.find(params[:course_template_id])
    @course_template.move_lower
    
    @ppos_template = PposTemplate.find(params[:ppos_template_id])
    @degree_program = DegreeProgram.find(@ppos_template.degree_program_id)
    @department = Department.find(@degree_program.department_id)
    header_template = @course_template.header_template
    
    respond_to do |format|
      format.html { render :partial => 'header_template',
                    :locals  => {:header_templates => @ppos_template.header_templates,
                            :ppos_template    => @ppos_template,
                            :degree_program   => @degree_program,
                            :department       => @department } }
    end
  end
  
end
