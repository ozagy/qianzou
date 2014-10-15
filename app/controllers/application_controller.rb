class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
protected  
  def require_admin
    unless session[:admin]
      redirect_to admin_path
      return false
    end
  end
  
end
