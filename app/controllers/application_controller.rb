class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :set_timezone

  private

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by id: session[:user_id]
    end
  end

  def require_user_logged_in!
    unless Current.user
      redirect_to sign_in_path, notice: 'Please login to access this page'
    end
  end

  def set_timezone
    Time.zone = Current.user&.timezone || 'UTC'
  end
end
