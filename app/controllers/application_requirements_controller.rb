class ApplicationRequirementsController < ApplicationController
  # GET /application_requirements
  # GET /application_requirements.xml
  def index
    @application_requirements = ApplicationRequirement.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @application_requirements }
    end
  end

  # GET /application_requirements/1
  # GET /application_requirements/1.xml
  def show
    @application_requirement = ApplicationRequirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @application_requirement }
    end
  end

  # GET /application_requirements/new
  # GET /application_requirements/new.xml
  def new
    @application_requirement = ApplicationRequirement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @application_requirement }
    end
  end

  # GET /application_requirements/1/edit
  def edit
    @application_requirement = ApplicationRequirement.find(params[:id])
  end

  # POST /application_requirements
  # POST /application_requirements.xml
  def create
    @application_requirement = ApplicationRequirement.new(params[:application_requirement])

    respond_to do |format|
      if @application_requirement.save
        flash[:notice] = 'ApplicationRequirement was successfully created.'
        format.html { redirect_to(@application_requirement) }
        format.xml  { render :xml => @application_requirement, :status => :created, :location => @application_requirement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @application_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /application_requirements/1
  # PUT /application_requirements/1.xml
  def update
    @application_requirement = ApplicationRequirement.find(params[:id])

    respond_to do |format|
      if @application_requirement.update_attributes(params[:application_requirement])
        flash[:notice] = 'ApplicationRequirement was successfully updated.'
        format.html { redirect_to(@application_requirement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @application_requirement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /application_requirements/1
  # DELETE /application_requirements/1.xml
  def destroy
    @application_requirement = ApplicationRequirement.find(params[:id])
    @application_requirement.destroy

    respond_to do |format|
      format.html { redirect_to(application_requirements_url) }
      format.xml  { head :ok }
    end
  end
end
