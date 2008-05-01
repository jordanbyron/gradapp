class PposCoursesController < ApplicationController
  # GET /ppos_courses
  # GET /ppos_courses.xml
  def index
    @ppos_courses = PposCourse.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ppos_courses }
    end
  end

  # GET /ppos_courses/1
  # GET /ppos_courses/1.xml
  def show
    @ppos_course = PposCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ppos_course }
    end
  end

  # GET /ppos_courses/new
  # GET /ppos_courses/new.xml
  def new
    @ppos_course = PposCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ppos_course }
    end
  end

  # GET /ppos_courses/1/edit
  def edit
    @ppos_course = PposCourse.find(params[:id])
  end

  # POST /ppos_courses
  # POST /ppos_courses.xml
  def create
    @ppos_course = PposCourse.new(params[:ppos_course])

    respond_to do |format|
      if @ppos_course.save
        flash[:notice] = 'PposCourse was successfully created.'
        format.html { redirect_to(@ppos_course) }
        format.xml  { render :xml => @ppos_course, :status => :created, :location => @ppos_course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ppos_course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ppos_courses/1
  # PUT /ppos_courses/1.xml
  def update
    @ppos_course = PposCourse.find(params[:id])

    respond_to do |format|
      if @ppos_course.update_attributes(params[:ppos_course])
        flash[:notice] = 'PposCourse was successfully updated.'
        format.html { redirect_to(@ppos_course) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ppos_course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ppos_courses/1
  # DELETE /ppos_courses/1.xml
  def destroy
    @ppos_course = PposCourse.find(params[:id])
    @ppos_course.destroy

    respond_to do |format|
      format.html { redirect_to(ppos_courses_url) }
      format.xml  { head :ok }
    end
  end
end
