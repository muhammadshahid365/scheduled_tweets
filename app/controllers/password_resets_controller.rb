class PasswordResetsController < ApplicationController
  before_action :set_user, only: %w(edit update)

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      # send email
      PasswordMailer.with(user: user).reset.deliver_later
    end

    redirect_to root_path, notice: 'Password reset instructions has been sent to your email address!'
  end

  def edit
  end

  def update
    if @user.update(password_reset_params)
      redirect_to sign_in_path, notice: "Please login using new password"
    else
      redirect_back fallback_location: root_path, alert: @user.errors.full_messages.join('\n')
    end
  end

  private

  def password_reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def set_user
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, notice: 'Your token has been expired'
  end
end
