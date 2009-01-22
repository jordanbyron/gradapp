class AttachmentsController < ApplicationController
  before_filter :gc_required
  
  # GET /attachments
  # GET /attachments.xml
  def index
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @attachments = Attachments.find(:all, :conditions =>{ :graduate_applicant_id => @graduate_applicant })
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attachments }
    end
  end

  # GET /attachments/1
  # GET /attachments/1.xml
  def show
    @attachments = Attachments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attachments }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.xml
  def new
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @attachment = Attachments.new
    @attachment.graduate_applicant_id = @graduate_applicant.id
    @attachment.created_by = current_user.login

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attachments }
    end
  end

  # GET /attachments/1/edit
  def edit
    @attachments = Attachments.find(params[:id])
  end

  # POST /attachments
  # POST /attachments.xml
  def create
    @attachments = Attachments.new(params[:attachments])

    respond_to do |format|
      if @attachments.save
        flash[:notice] = 'Attachment was successfully created.'
        format.html { redirect_to graduate_applicant_attachments_path(@attachments.graduate_applicant) }
        format.xml  { render :xml => @attachments, :status => :created, :location => @attachments }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attachments.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attachments/1
  # PUT /attachments/1.xml
  def update
    @attachments = Attachments.find(params[:id])

    respond_to do |format|
      if @attachments.update_attributes(params[:attachments])
        flash[:notice] = 'Attachment was successfully updated.'
        format.html { graduate_applicant_attachments_path(@attachments.graduate_applicant)  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attachments.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.xml
  def destroy
    @attachments = Attachments.find(params[:id])
    @attachments.destroy

    respond_to do |format|
      flash[:notice] = 'Attachment was successfully deleted.'
      format.html { redirect_to graduate_applicant_attachments_path(@attachments.graduate_applicant) }
      format.xml  { head :ok }
    end
  end
end
