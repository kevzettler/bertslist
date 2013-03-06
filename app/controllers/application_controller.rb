class ApplicationController < ActionController::Base
  before_filter :session_message
  protect_from_forgery

  def session_message
    if session[:message]
      session[:message] = nil
      flash[:notice] = session[:message]
    end
  end

  def after_sign_in_path_for(resource)
      users_verify_path
  end
end