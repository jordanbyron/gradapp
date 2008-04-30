class PrerequisiteTemplatesController < ApplicationController
  # GET /prerequisite_templates
  # GET /prerequisite_templates.xml
  def index
    @prerequisite_templates = PrerequisiteTemplate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prerequisite_templates }
    end
  end

  # GET /prerequisite_templates/1
  # GET /prerequisite_templates/1.xml
  def show
    @prerequisite_template = PrerequisiteTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prerequisite_template }
    end
  end

  # GET /prerequisite_templates/new
  # GET /prerequisite_templates/new.xml
  def new
    @prerequisite_template = PrerequisiteTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prerequisite_template }
    end
  end

  # GET /prerequisite_templates/1/edit
  def edit
    @prerequisite_template = PrerequisiteTemplate.find(params[:id])
  end

  # POST /prerequisite_templates
  # POST /prerequisite_templates.xml
  def create
    @prerequisite_template = PrerequisiteTemplate.new(params[:prerequisite_template])

    respond_to do |format|
      if @prerequisite_template.save
        flash[:notice] = 'PrerequisiteTemplate was successfully created.'
        format.html { redirect_to(@prerequisite_template) }
        format.xml  { render :xml => @prerequisite_template, :status => :created, :location => @prerequisite_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prerequisite_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prerequisite_templates/1
  # PUT /prerequisite_templates/1.xml
  def update
    @prerequisite_template = PrerequisiteTemplate.find(params[:id])

    respond_to do |format|
      if @prerequisite_template.update_attributes(params[:prerequisite_template])
        flash[:notice] = 'PrerequisiteTemplate was successfully updated.'
        format.html { redirect_to(@prerequisite_template) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prerequisite_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prerequisite_templates/1
  # DELETE /prerequisite_templates/1.xml
  def destroy
    @prerequisite_template = PrerequisiteTemplate.find(params[:id])
    @prerequisite_template.destroy

    respond_to do |format|
      format.html { redirect_to(prerequisite_templates_url) }
      format.xml  { head :ok }
    end
  end
end
