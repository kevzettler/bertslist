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
      if current_user.organization.verified?
          pets_path
      else
          new_organization_path
      end
  end
end
