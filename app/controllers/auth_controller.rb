class AuthController < ApplicationController
  def login
    if request.post?
      if session[:user] = User.authenticate(params[:username], params[:password])
        flash[:notice]  = "Login successful"
        redirect_to_stored
      else
        flash[:warning] = "Login unsuccessful"
      end
    end
  end

  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to :action => 'login'
  end
end
