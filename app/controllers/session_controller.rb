class SessionController < ApplicationController
  skip_before_filter :require_login

  def new
    @session = current_user || User.new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:current_user_id] = user.id
      flash[:succes] = "You successfully logged in!"
      redirect_to user
    end
    flash.now[:error] = "Unsuccessful login attempt"
    render 'new'
  end
  
  def destory
    session[:current_user_id] = nil
    flash[:success] = "You successfully logged out!"
    redirect_to login_url
  end
end
