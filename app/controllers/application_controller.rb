class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  protect_from_forgery
  before_filter :require_login

  private

  def require_login
    unless logged_in?
      redirect_to new_session_url
    end
  end

  def logged_in?
    !!current_user
  end
end
