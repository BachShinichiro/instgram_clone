class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  def authenticate_user
    if @current_user == nil
      flash[:notice] = I18n.t(:login_needed)
      redirect_to new_session_path
    end
  end
end
