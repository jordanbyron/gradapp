# This controller handles the login/logout function of the site.  
class SessionController < ApplicationController
  # render new.rhtml
  def new
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end

      if current_user.change_password
        redirect_to change_password_path(current_user.id)
      else
        redirect_back_or_default('/')
      end
      
      if current_user.login_count == nil
        current_user.login_count = 0
      end
      
      current_user.last_login = DateTime.now()
      current_user.login_count += 1
      current_user.last_ip = request.remote_ip 
      current_user.save
      
      test_email = false
      
      Notifier.deliver_user_logged_in(current_user) if test_email == true
        
      flash[:notice] = "Logged in successfully"
    else
      flash[:error] = "Authentication Failed."
      render :action => 'new'
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
