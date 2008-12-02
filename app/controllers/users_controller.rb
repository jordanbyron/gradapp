class UsersController < ApplicationController
  before_filter :admin_required, :only => [:index, :new, :create, :destroy]
  
  def index
    @users = User.search(params[:search], params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  # render new.rhtml
  def new
    @user = User.new
    @show_graduate_coordinator = false
    
    # Show Grad Coor If Departments Exist
    if Department.count() > 0
        @show_graduate_coordinator = true
    end
    
    respond_to do |format|
      format.html # new.rhtml
      format.xml  { render :xml => @user }
    end
  end

  def create
    #cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    password = User.newpass(10)
    @user.password = password
    @user.password_confirmation = password
    @user.save

    @show_graduate_coordinator = false
    
    # Show Grad Coor If Departments Exist
    if Department.count() > 0
        @show_graduate_coordinator = true
    end

    if @user.errors.empty?
    
      if User.count() == 1 #//Set newly created user as current user
        self.current_user = @user 
      end
      
      Notifier.deliver_user_added( @user, password ) # Email the user's credentials

      redirect_to(users_path)
      flash[:notice] = "User " + @user.login + " Created. Credentials have been emailed to " + @user.email
    else
      render :action => 'new'
    end
  end
  
  def edit  
    @user = User.find(params[:id])
    
    if !current_user.admin && current_user != @user
      access_denied
    else
      @show_graduate_coordinator = false
    
      # Show Grad Coor If Departments Exist
      if Department.count() > 0
        @show_graduate_coordinator = true
      end
    
      respond_to do |format|
        format.html # edit.html.erb
        format.xml  { render :xml => @user }
      end
    end
  end
  
  def update
    @user = User.find(params[:id])

   if !current_user.admin && current_user != @user
      access_denied
    else
    respond_to do |format|
      if @user.update_attributes(params[:user])
      
        if params[:commit] == 'Update'
          flash[:notice] = 'User was successfully updated.'
        
          format.html { redirect_to(edit_user_path(@user)) }
          format.xml  { head :ok }
        else
          flash[:notice] = 'Password was successfully changed.'
        
          format.html { redirect_to(home_path) }
          format.xml  { head :ok }
        end
      else
        @show_graduate_coordinator = false
    
        # Show Grad Coor If Departments Exist
        if Department.count() > 0
            @show_graduate_coordinator = true
        end
      
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
    end
  end
  
  def show
    redirect_to(users_path)
  end
  
  def destroy
    @user = User.find(params[:id])
    
    if self.current_user == @user
      flash[:error] = 'Cannot Destroy Current User.'
    else
      @user.destroy
      flash[:notice] = 'User destroyed.'
    end
	
    redirect_to(users_path)
  end
  
  def change_password
    @user = User.find(params[:user_id])
    
    if current_user != @user
      access_denied
    else      
      respond_to do |format|
        format.html
      end
    end
  end	
end
