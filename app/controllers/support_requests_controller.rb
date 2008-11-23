class SupportRequestsController < ApplicationController
  # GET /support_requests
  # GET /support_requests.xml
  def index
    @support_requests = SupportRequest.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @support_requests }
    end
  end

  # GET /support_requests/1
  # GET /support_requests/1.xml
  def show
    @support_request = SupportRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @support_request }
    end
  end

  # GET /support_requests/new
  # GET /support_requests/new.xml
  def new
    @support_request = SupportRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @support_request }
    end
  end

  # GET /support_requests/1/edit
  def edit
    @support_request = SupportRequest.find(params[:id])
  end

  # POST /support_requests
  # POST /support_requests.xml
  def create
    @support_request = SupportRequest.new(params[:support_request])

    respond_to do |format|
      if @support_request.save
        #flash[:notice] = 'SupportRequest was successfully created.'
        
        Notifier.deliver_support_request_submitted(@support_request, current_user)
        
        format.html { redirect_to support_thank_you_path }
        #format.xml  { render :xml => @support_request, :status => :created, :location => @support_request }
      else
        format.html { render support_path }
        format.xml  { render :xml => @support_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /support_requests/1
  # PUT /support_requests/1.xml
  def update
    @support_request = SupportRequest.find(params[:id])

    respond_to do |format|
      if @support_request.update_attributes(params[:support_request])
        flash[:notice] = 'SupportRequest was successfully updated.'
        format.html { redirect_to(@support_request) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @support_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /support_requests/1
  # DELETE /support_requests/1.xml
  def destroy
    @support_request = SupportRequest.find(params[:id])
    @support_request.destroy

    respond_to do |format|
      format.html { redirect_to(support_requests_url) }
      format.xml  { head :ok }
    end
  end
  
  def thank_you
    
  end
end
