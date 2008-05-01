class PposController < ApplicationController
  # GET /ppos
  # GET /ppos.xml
  def index
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @ppos = Ppos.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ppos }
    end
  end

  # GET /ppos/1
  # GET /ppos/1.xml
  def show
    @ppos = Ppos.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ppos }
    end
  end

  # GET /ppos/new
  # GET /ppos/new.xml
  def new
    @ppos = Ppos.new
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])

    # Get PPoS template
    @ppos_template = PposTemplate.find(DegreeProgram.find(@graduate_applicant.degree_program_id).ppos_template)
    @ppos.total_concentrations = @ppos_template.concentrations

    # Load PPoS Template Body
    for header_template in @ppos_template.header_templates
      ppos_header = @ppos.ppos_headers.build({:header => header_template.header, :position => header_template.position})
      for course_template in header_template.course_templates
        ppos_header.ppos_courses.build({:short_dept_name => course_template.short_dept_name, :course_number => course_template.course_number, :course_name => course_template.course_name, :credits => course_template.credits, :position => course_template.position})
      end
    end
    
    # Load PPoS Prerequisite Templates
    for prerequisite_template in @ppos_template.prerequisite_templates
      @ppos.ppos_prerequisites.build({:prerequisite => prerequisite_template.prerequisite, :position => prerequisite_template.position})
    end

    @ppos.graduate_applicant_id = @graduate_applicant.id
    @ppos.degree_program_id = @graduate_applicant.degree_program_id

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ppos }
    end
  end

  # GET /ppos/1/edit
  def edit
    @ppos = Ppos.find(params[:id])
  end

  # POST /ppos
  # POST /ppos.xml
  def create
    @ppos = Ppos.new(params[:ppos])

    respond_to do |format|
      if @ppos.save
        flash[:notice] = 'Ppos was successfully created.'
        format.html { redirect_to(@ppos) }
        format.xml  { render :xml => @ppos, :status => :created, :location => @ppos }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ppos.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ppos/1
  # PUT /ppos/1.xml
  def update
    @ppos = Ppos.find(params[:id])

    respond_to do |format|
      if @ppos.update_attributes(params[:ppos])
        flash[:notice] = 'Ppos was successfully updated.'
        format.html { redirect_to(@ppos) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ppos.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ppos/1
  # DELETE /ppos/1.xml
  def destroy
    @ppos = Ppos.find(params[:id])
    @ppos.destroy

    respond_to do |format|
      format.html { redirect_to(ppos_url) }
      format.xml  { head :ok }
    end
  end
end
