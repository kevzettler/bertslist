class ApplicationController < ActionController::Base
  before_filter :session_message
  protect_from_forgery

  def session_message
    if session[:message]
      session[:message] = nil
      flash[:notice] = session[:message]
    end
  end
end
