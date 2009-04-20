class CorrespondencesController < ApplicationController
  before_filter :gc_required

  def index
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @correspondences = Correspondence.search(params[:search], params[:page],params[:graduate_applicant_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @correspondences }
    end
  end

  # GET /graduate_applicants/:graduate_applicant_id/correspondences/new
  # GET /graduate_applicants/:graduate_applicant_id/correspondences/new.xml
  def new
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @correspondence = @graduate_applicant.correspondences.build
    
    if params[:correspondence_template_id] != nil
      @correspondence_template = CorrespondenceTemplate.find(params[:correspondence_template_id][0])
      @correspondence.text = @correspondence_template.generate(@graduate_applicant)
      @correspondence.subject = @correspondence_template.subject
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @correspondence }
    end
  end

  def show
    @correspondence = Correspondence.find(params[:id])
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    
    @action = flash[:action]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @correspondence }
    end
  end

  def print
    @correspondence = Correspondence.find(params[:correspondence_id])
    @graduate_applicant = @correspondence.graduate_applicant

    render :action => "print", :layout => "printLetter"
  
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @ppos }
    #end
  end

  def create
    @graduate_applicant = GraduateApplicant.find(params[:correspondence][:graduate_applicant_id])
    @correspondence = @graduate_applicant.correspondences.build(params[:correspondence])
    @correspondence.correspondence_type = params[:commit]
    
    respond_to do |format|
      if @correspondence.save
        flash[:action] = @correspondence.correspondence_type
      
        format.html { redirect_to graduate_applicant_correspondence_path(@graduate_applicant, @correspondence) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @correspondence = Correspondence.find(params[:id])
    @graduate_applicant =  @correspondence.graduate_applicant

    @correspondence.destroy

    respond_to do |format|
      flash[:notice] = 'Correspondence was removed.'
      format.html { redirect_to graduate_applicant_correspondences_path(@graduate_applicant) }
    end
  end

end
