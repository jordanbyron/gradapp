class CorrespondenceTemplatesController < ApplicationController
  before_filter :gc_required
  
  # GET /correspondence_templates
  # GET /correspondence_templates.xml
  def index
    @correspondence_templates = CorrespondenceTemplate.find(:all, :conditions => { :department_id => current_user.department_id })

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @correspondence_templates }
    end
  end

  # GET /correspondence_templates/1
  # GET /correspondence_templates/1.xml
  def show
    @correspondence_template = CorrespondenceTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @correspondence_template }
    end
  end

  # GET /correspondence_templates/new
  # GET /correspondence_templates/new.xml
  def new
    @correspondence_template = CorrespondenceTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @correspondence_template }
    end
  end

  # GET /correspondence_templates/1/edit
  def edit
    @correspondence_template = CorrespondenceTemplate.find(params[:id])
  end

  # POST /correspondence_templates
  # POST /correspondence_templates.xml
  def create
    @correspondence_template = CorrespondenceTemplate.new(params[:correspondence_template])

    @correspondence_template.department_id = current_user.department_id

    respond_to do |format|
      if @correspondence_template.save
        flash[:notice] = 'CorrespondenceTemplate was successfully created.'
        format.html { redirect_to(@correspondence_template) }
        format.xml  { render :xml => @correspondence_template, :status => :created, :location => @correspondence_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @correspondence_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /correspondence_templates/1
  # PUT /correspondence_templates/1.xml
  def update
    @correspondence_template = CorrespondenceTemplate.find(params[:id])

    respond_to do |format|
      if @correspondence_template.update_attributes(params[:correspondence_template])
        flash[:notice] = 'CorrespondenceTemplate was successfully updated.'
        format.html { redirect_to(@correspondence_template) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @correspondence_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /correspondence_templates/1
  # DELETE /correspondence_templates/1.xml
  def destroy
    @correspondence_template = CorrespondenceTemplate.find(params[:id])
    @correspondence_template.destroy

    respond_to do |format|
      format.html { redirect_to(correspondence_templates_url) }
      format.xml  { head :ok }
    end
  end
end
