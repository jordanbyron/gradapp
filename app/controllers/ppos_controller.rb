class PposController < ApplicationController
  # GET /ppos
  # GET /ppos.xml
  def index
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @ppos = Ppos.find(:all, :conditions => {:graduate_applicant_id => params[:graduate_applicant_id]})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ppos }
    end
  end

  # GET /ppos/1
  # GET /ppos/1.xml
  def show
    @ppos = Ppos.find(params[:id])
    @graduate_applicant = @ppos.graduate_applicant

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
 
    @ppos_template = @graduate_applicant.degree_program.ppos_template
    @ppos.total_concentrations = @ppos_template.concentrations
                                                                      
    load_ppos_template_body

    load_ppos_prereq_templates

    @ppos.graduate_applicant_id = @graduate_applicant.id
    @ppos.degree_program_id = @graduate_applicant.degree_program.id

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
        params[:ppos][:course_attributes].each do |attributes|
          header = @ppos.ppos_headers.find(:first, :conditions => {:position => attributes[:header_position]})
          if attributes[:taken] == nil
            attributes[:taken] = 0
          end
          course = header.ppos_courses.build(attributes)
          course.save
        end
      
        flash[:notice] = 'Ppos was successfully created.'
        format.html { redirect_to ppos_path(@ppos.graduate_applicant_id) }
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
  
  protected
  
  def load_ppos_template_body
    @ppos_template.header_templates.each do |h|
      ppos_header = @ppos.ppos_headers.build(:header   => h.header, 
                                             :position => h.position)
      h.course_templates.each do |c|
        ppos_header.ppos_courses.build(:short_dept_name => c.short_dept_name, 
                                       :course_number   => c.course_number, 
                                       :course_name     => c.course_name, 
                                       :credits         => c.credits, 
                                       :position        => c.position)
      end
    end                      
  end                        
  
  def load_ppos_prereq_templates
    @ppos_template.prerequisite_templates.each do |t|
      @ppos.ppos_prerequisites.build( :prerequisite => t.prerequisite, 
                                      :position     => t.position)
    end  
  end
  
end
