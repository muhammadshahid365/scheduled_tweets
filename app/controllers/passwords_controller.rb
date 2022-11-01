class PasswordsController < ApplicationController
  before_action :set_user
  before_action :require_user
  before_action :authenticate_current_password, only: [:update]

  def edit
  end

  def update
    if @user.update(password_params)
      redirect_to root_path, notice: 'Password updated successfully!'
    else
      redirect_to password_path, alert: 'Confirm password did not match!'
    end
  end

  private

  def require_user
    redirect_to root_path unless @user
  end

  def authenticate_current_password
    return if @user.authenticate params[:current_password]

    redirect_to password_path, alert: 'Current password is incorrect!'
  end

  def set_user
    @user = Current.user
  end

  def password_params
    {
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    }
  end
end
