class DepartmentStatusesController < ApplicationController
  before_filter :gc_required

  # GET /department_statuses
  # GET /department_statuses.xml
  def index
    @department_statuses = DepartmentStatus.find(:all, :conditions =>{ :department_id => current_user.department_id })
    @department = Department.find(params[:department_id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @department_statuses }
    end
  end

  # GET /department_statuses/1
  # GET /department_statuses/1.xml
  def show
    @department_status = DepartmentStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @department_status }
    end
  end

  # GET /department_statuses/new
  # GET /department_statuses/new.xml
  def new
    @department_status = DepartmentStatus.new
    @department_status.department = Department.find(params[:department_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @department_status }
    end
  end

  # GET /department_statuses/1/edit
  def edit
    @department_status = DepartmentStatus.find(params[:id])
  end

  # POST /department_statuses
  # POST /department_statuses.xml
  def create
    @department_status = DepartmentStatus.new(params[:department_status])

    respond_to do |format|
      if @department_status.save
        flash[:notice] = 'Status was successfully created.'
        format.html { redirect_to department_department_statuses_path(@department_status.department) }
        format.xml  { render :xml => @department_status, :status => :created, :location => @department_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @department_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /department_statuses/1
  # PUT /department_statuses/1.xml
  def update
    @department_status = DepartmentStatus.find(params[:id])

    respond_to do |format|
      if @department_status.update_attributes(params[:department_status])
        flash[:notice] = 'Status was successfully updated.'
        format.html { redirect_to department_department_statuses_path(@department_status.department) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @department_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /department_statuses/1
  # DELETE /department_statuses/1.xml
  def destroy
    @department_status = DepartmentStatus.find(params[:id])
    @department_status.destroy

    respond_to do |format|
      format.html { redirect_to(department_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
