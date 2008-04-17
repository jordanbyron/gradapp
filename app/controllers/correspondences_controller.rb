class CorrespondencesController < ApplicationController
  # GET /correspondences
  # GET /correspondences.xml
  def index
    @correspondences = Correspondence.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @correspondences }
    end
  end

  # GET /correspondences/1
  # GET /correspondences/1.xml
  def show
    @correspondence = Correspondence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @correspondence }
    end
  end

  # GET /correspondences/new
  # GET /correspondences/new.xml
  def new
    @correspondence = Correspondence.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @correspondence }
    end
  end

  # GET /correspondences/1/edit
  def edit
    @correspondence = Correspondence.find(params[:id])
  end

  # POST /correspondences
  # POST /correspondences.xml
  def create
    @correspondence = Correspondence.new(params[:correspondence])

    respond_to do |format|
      if @correspondence.save
        flash[:notice] = 'Correspondence was successfully created.'
        format.html { redirect_to(@correspondence) }
        format.xml  { render :xml => @correspondence, :status => :created, :location => @correspondence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @correspondence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /correspondences/1
  # PUT /correspondences/1.xml
  def update
    @correspondence = Correspondence.find(params[:id])

    respond_to do |format|
      if @correspondence.update_attributes(params[:correspondence])
        flash[:notice] = 'Correspondence was successfully updated.'
        format.html { redirect_to(@correspondence) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @correspondence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /correspondences/1
  # DELETE /correspondences/1.xml
  def destroy
    @correspondence = Correspondence.find(params[:id])
    @correspondence.destroy

    respond_to do |format|
      format.html { redirect_to(correspondences_url) }
      format.xml  { head :ok }
    end
  end
end
