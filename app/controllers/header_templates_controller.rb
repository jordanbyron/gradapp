class HeaderTemplatesController < ApplicationController
  # GET /header_templates
  # GET /header_templates.xml
  def index
    @header_templates = HeaderTemplate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @header_templates }
    end
  end

  # GET /header_templates/1
  # GET /header_templates/1.xml
  def show
    @header_template = HeaderTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @header_template }
    end
  end

  # GET /header_templates/new
  # GET /header_templates/new.xml
  def new
    @header_template = HeaderTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @header_template }
    end
  end

  # GET /header_templates/1/edit
  def edit
    @header_template = HeaderTemplate.find(params[:id])
  end

  # POST /header_templates
  # POST /header_templates.xml
  def create
    @header_template = HeaderTemplate.new(params[:header_template])

    respond_to do |format|
      if @header_template.save
        flash[:notice] = 'HeaderTemplate was successfully created.'
        format.html { redirect_to(@header_template) }
        format.xml  { render :xml => @header_template, :status => :created, :location => @header_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @header_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /header_templates/1
  # PUT /header_templates/1.xml
  def update
    @header_template = HeaderTemplate.find(params[:id])

    respond_to do |format|
      if @header_template.update_attributes(params[:header_template])
        flash[:notice] = 'HeaderTemplate was successfully updated.'
        format.html { redirect_to(@header_template) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @header_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /header_templates/1
  # DELETE /header_templates/1.xml
  def destroy
    @header_template = HeaderTemplate.find(params[:id])
    @header_template.destroy

    respond_to do |format|
      format.html { redirect_to(header_templates_url) }
      format.xml  { head :ok }
    end
  end
end
