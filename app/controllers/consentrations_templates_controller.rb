class ConsentrationsTemplatesController < ApplicationController
  # GET /consentrations_templates
  # GET /consentrations_templates.xml
  def index
    @consentrations_templates = ConsentrationsTemplate.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @consentrations_templates }
    end
  end

  # GET /consentrations_templates/1
  # GET /consentrations_templates/1.xml
  def show
    @consentrations_template = ConsentrationsTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @consentrations_template }
    end
  end

  # GET /consentrations_templates/new
  # GET /consentrations_templates/new.xml
  def new
    @consentrations_template = ConsentrationsTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @consentrations_template }
    end
  end

  # GET /consentrations_templates/1/edit
  def edit
    @consentrations_template = ConsentrationsTemplate.find(params[:id])
  end

  # POST /consentrations_templates
  # POST /consentrations_templates.xml
  def create
    @consentrations_template = ConsentrationsTemplate.new(params[:consentrations_template])

    respond_to do |format|
      if @consentrations_template.save
        flash[:notice] = 'ConsentrationsTemplate was successfully created.'
        format.html { redirect_to(@consentrations_template) }
        format.xml  { render :xml => @consentrations_template, :status => :created, :location => @consentrations_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @consentrations_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /consentrations_templates/1
  # PUT /consentrations_templates/1.xml
  def update
    @consentrations_template = ConsentrationsTemplate.find(params[:id])

    respond_to do |format|
      if @consentrations_template.update_attributes(params[:consentrations_template])
        flash[:notice] = 'ConsentrationsTemplate was successfully updated.'
        format.html { redirect_to(@consentrations_template) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @consentrations_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /consentrations_templates/1
  # DELETE /consentrations_templates/1.xml
  def destroy
    @consentrations_template = ConsentrationsTemplate.find(params[:id])
    @consentrations_template.destroy

    respond_to do |format|
      format.html { redirect_to(consentrations_templates_url) }
      format.xml  { head :ok }
    end
  end
end
