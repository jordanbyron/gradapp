class UsersController < ApplicationController
  before_filter :login_required
  
  def index
	@users = User.find(:all)

	respond_to do |format|
	  format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
  
  # render new.rhtml
  def new
  end

  def create
    #cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      #self.current_user = @user //Don't set newly created user as current user
      redirect_to(users_path)
      flash[:notice] = "User " + @user.login + " Created"
    else
      render :action => 'new'
    end
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
    #respond_to do |format|
    #  format.html { redirect_to(users_path) }
    #end
  end	
  
end
