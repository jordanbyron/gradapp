class StudentStatusesController < ApplicationController
  # GET /student_statuses
  # GET /student_statuses.xml
  def index
    @student_statuses = StudentStatus.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_statuses }
    end
  end

  # GET /student_statuses/1
  # GET /student_statuses/1.xml
  def show
    @student_status = StudentStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_status }
    end
  end

  # GET /student_statuses/new
  # GET /student_statuses/new.xml
  def new
    @student_status = StudentStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_status }
    end
  end

  # GET /student_statuses/1/edit
  def edit
    @student_status = StudentStatus.find(params[:id])
  end

  # POST /student_statuses
  # POST /student_statuses.xml
  def create
    @student_status = StudentStatus.new(params[:student_status])

    respond_to do |format|
      if @student_status.save
        flash[:notice] = 'StudentStatus was successfully created.'
        format.html { redirect_to(@student_status) }
        format.xml  { render :xml => @student_status, :status => :created, :location => @student_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_statuses/1
  # PUT /student_statuses/1.xml
  def update
    @student_status = StudentStatus.find(params[:id])

    respond_to do |format|
      if @student_status.update_attributes(params[:student_status])
        flash[:notice] = 'StudentStatus was successfully updated.'
        format.html { redirect_to(@student_status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_statuses/1
  # DELETE /student_statuses/1.xml
  def destroy
    @student_status = StudentStatus.find(params[:id])
    @student_status.destroy

    respond_to do |format|
      format.html { redirect_to(student_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
