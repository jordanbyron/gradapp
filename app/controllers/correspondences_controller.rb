class CorrespondencesController < ApplicationController
  before_filter :gc_required

  def index
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @correspondences = @graduate_applicant.correspondences.collect

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @correspondences }
    end
  end

  # GET /graduate_applicants/:graduate_applicant_id/correspondences/new
  # GET /graduate_applicants/:graduate_applicant_id/correspondences/new.xml
  def new
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @correspondence = Correspondence.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @corresponndence }
    end
  end

  def show
    @correspondence = Correspondence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @correspondence }
    end
  end

  def create
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @correspondence = @graduate_applicant.correspondences.build(params[:correspondence])

    respond_to do |format|
      if @correspondence.save
        flash[:notice] = 'Correspondence was successfully created.'
        format.html { redirect_to @graduate_applicant }
        format.js # renders create.js.rjs
      else
        format.html { redirect_to @graduate_applicant }
        format.js do
          render :update do |page| 
            page.redirect_to @graduate_applicant 
          end
        end
      end
    end
  end

  def destroy
    @graduate_applicant = GraduateApplicant.find(params[:graduate_applicant_id])
    @correspondence = @graduate_applicant.correspondences.find(params[:id]) 
    
    @correspondence.destroy

    respond_to do |format|
      flash[:notice] = 'Correspondence was removed.'
      format.html { redirect_to  }
    end
  end
  
end
