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
    @course_template = CourseTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @course_template }
    end
  end

  # GET /course_templates/1/edit
  def edit
    @course_template = CourseTemplate.find(params[:id])
  end

  # POST /course_templates
  # POST /course_templates.xml
  def create
    @course_template = CourseTemplate.new(params[:course_template])

    respond_to do |format|
      if @course_template.save
        flash[:notice] = 'CourseTemplate was successfully created.'
        format.html { redirect_to(@course_template) }
        format.xml  { render :xml => @course_template, :status => :created, :location => @course_template }
      else
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
        flash[:notice] = 'CourseTemplate was successfully updated.'
        format.html { redirect_to(@course_template) }
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
      format.html { redirect_to(course_templates_url) }
      format.xml  { head :ok }
    end
  end
end
