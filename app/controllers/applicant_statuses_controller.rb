class ApplicantStatusesController < ApplicationController
  before_filter :admin_required

  # GET /applicant_statuses
  # GET /applicant_statuses.xml
  def index
    @applicant_statuses = ApplicantStatus.search(params[:search], params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @applicant_statuses }
    end
  end

  # GET /applicant_statuses/1
  # GET /applicant_statuses/1.xml
  def show
    @applicant_status = ApplicantStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @applicant_status }
    end
  end

  # GET /applicant_statuses/new
  # GET /applicant_statuses/new.xml
  def new
    @applicant_status = ApplicantStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @applicant_status }
    end
  end

  # GET /applicant_statuses/1/edit
  def edit
    @applicant_status = ApplicantStatus.find(params[:id])
  end

  # POST /applicant_statuses
  # POST /applicant_statuses.xml
  def create
    @applicant_status = ApplicantStatus.new(params[:applicant_status])

    respond_to do |format|
      if @applicant_status.save
        flash[:notice] = 'ApplicantStatus was successfully created.'
        format.html { redirect_to(@applicant_status) }
        format.xml  { render :xml => @applicant_status, :status => :created, :location => @applicant_status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @applicant_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /applicant_statuses/1
  # PUT /applicant_statuses/1.xml
  def update
    @applicant_status = ApplicantStatus.find(params[:id])

    respond_to do |format|
      if @applicant_status.update_attributes(params[:applicant_status])
        flash[:notice] = 'ApplicantStatus was successfully updated.'
        format.html { redirect_to(@applicant_status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @applicant_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /applicant_statuses/1
  # DELETE /applicant_statuses/1.xml
  def destroy
    @applicant_status = ApplicantStatus.find(params[:id])
    @applicant_status.destroy

    respond_to do |format|
      format.html { redirect_to(applicant_statuses_url) }
      format.xml  { head :ok }
    end
  end
end
