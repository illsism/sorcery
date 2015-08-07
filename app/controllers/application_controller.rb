class ApplicationController < ActionController::Base
  before_filter :require_login
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def not_authenticated
    flash[:danger] = "Please log in first!"
    redirect_to login_path
  end

  def not_found
    flash[:danger] = "#{params[:controller].chop.capitalize } not found."
    redirect_back_or_to controller: params[:controller]
  end

end
