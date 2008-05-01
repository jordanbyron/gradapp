class PposHeadersController < ApplicationController
  # GET /ppos_headers
  # GET /ppos_headers.xml
  def index
    @ppos_headers = PposHeader.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ppos_headers }
    end
  end

  # GET /ppos_headers/1
  # GET /ppos_headers/1.xml
  def show
    @ppos_header = PposHeader.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ppos_header }
    end
  end

  # GET /ppos_headers/new
  # GET /ppos_headers/new.xml
  def new
    @ppos_header = PposHeader.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ppos_header }
    end
  end

  # GET /ppos_headers/1/edit
  def edit
    @ppos_header = PposHeader.find(params[:id])
  end

  # POST /ppos_headers
  # POST /ppos_headers.xml
  def create
    @ppos_header = PposHeader.new(params[:ppos_header])

    respond_to do |format|
      if @ppos_header.save
        flash[:notice] = 'PposHeader was successfully created.'
        format.html { redirect_to(@ppos_header) }
        format.xml  { render :xml => @ppos_header, :status => :created, :location => @ppos_header }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ppos_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ppos_headers/1
  # PUT /ppos_headers/1.xml
  def update
    @ppos_header = PposHeader.find(params[:id])

    respond_to do |format|
      if @ppos_header.update_attributes(params[:ppos_header])
        flash[:notice] = 'PposHeader was successfully updated.'
        format.html { redirect_to(@ppos_header) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ppos_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ppos_headers/1
  # DELETE /ppos_headers/1.xml
  def destroy
    @ppos_header = PposHeader.find(params[:id])
    @ppos_header.destroy

    respond_to do |format|
      format.html { redirect_to(ppos_headers_url) }
      format.xml  { head :ok }
    end
  end
end
