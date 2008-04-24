class DegreeProgramsController < ApplicationController
  before_filter :gc_required

  # GET /degree_programs
  # GET /degree_programs.xml
  def index
    @degree_programs = DegreeProgram.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @degree_programs }
    end
  end

  # GET /degree_programs/1
  # GET /degree_programs/1.xml
  def show
    @degree_program = DegreeProgram.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @degree_program }
    end
  end

  # GET /degree_programs/new
  # GET /degree_programs/new.xml
  def new
    @degree_program = DegreeProgram.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @degree_program }
    end
  end

  # GET /degree_programs/1/edit
  def edit
    @degree_program = DegreeProgram.find(params[:id])
  end

  # POST /degree_programs
  # POST /degree_programs.xml
  def create
    @degree_program = DegreeProgram.new(params[:degree_program])

    respond_to do |format|
      if @degree_program.save
        flash[:notice] = 'DegreeProgram was successfully created.'
        format.html { redirect_to(@degree_program) }
        format.xml  { render :xml => @degree_program, :status => :created, :location => @degree_program }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @degree_program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /degree_programs/1
  # PUT /degree_programs/1.xml
  def update
    @degree_program = DegreeProgram.find(params[:id])

    respond_to do |format|
      if @degree_program.update_attributes(params[:degree_program])
        flash[:notice] = 'DegreeProgram was successfully updated.'
        format.html { redirect_to(@degree_program) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @degree_program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /degree_programs/1
  # DELETE /degree_programs/1.xml
  def destroy
    @degree_program = DegreeProgram.find(params[:id])
    @degree_program.destroy

    respond_to do |format|
      format.html { redirect_to(degree_programs_url) }
      format.xml  { head :ok }
    end
  end
end
