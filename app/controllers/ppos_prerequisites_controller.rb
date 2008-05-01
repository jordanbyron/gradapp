class PposPrerequisitesController < ApplicationController
  # GET /ppos_prerequisites
  # GET /ppos_prerequisites.xml
  def index
    @ppos_prerequisites = PposPrerequisite.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ppos_prerequisites }
    end
  end

  # GET /ppos_prerequisites/1
  # GET /ppos_prerequisites/1.xml
  def show
    @ppos_prerequisite = PposPrerequisite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ppos_prerequisite }
    end
  end

  # GET /ppos_prerequisites/new
  # GET /ppos_prerequisites/new.xml
  def new
    @ppos_prerequisite = PposPrerequisite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ppos_prerequisite }
    end
  end

  # GET /ppos_prerequisites/1/edit
  def edit
    @ppos_prerequisite = PposPrerequisite.find(params[:id])
  end

  # POST /ppos_prerequisites
  # POST /ppos_prerequisites.xml
  def create
    @ppos_prerequisite = PposPrerequisite.new(params[:ppos_prerequisite])

    respond_to do |format|
      if @ppos_prerequisite.save
        flash[:notice] = 'PposPrerequisite was successfully created.'
        format.html { redirect_to(@ppos_prerequisite) }
        format.xml  { render :xml => @ppos_prerequisite, :status => :created, :location => @ppos_prerequisite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ppos_prerequisite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ppos_prerequisites/1
  # PUT /ppos_prerequisites/1.xml
  def update
    @ppos_prerequisite = PposPrerequisite.find(params[:id])

    respond_to do |format|
      if @ppos_prerequisite.update_attributes(params[:ppos_prerequisite])
        flash[:notice] = 'PposPrerequisite was successfully updated.'
        format.html { redirect_to(@ppos_prerequisite) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ppos_prerequisite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ppos_prerequisites/1
  # DELETE /ppos_prerequisites/1.xml
  def destroy
    @ppos_prerequisite = PposPrerequisite.find(params[:id])
    @ppos_prerequisite.destroy

    respond_to do |format|
      format.html { redirect_to(ppos_prerequisites_url) }
      format.xml  { head :ok }
    end
  end
end
