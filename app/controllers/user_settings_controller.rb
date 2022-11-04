class UserSettingsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_redirect_url, only: [:edit]

  def edit
  end

  def update
    Current.user.update(timezone_params)
    if session[:from] == 'new_tweet'
      session[:from] = nil
      redirect_to new_tweet_path
    else
      redirect_to tweets_path
    end
  end

  private

  def timezone_params
    params.require(:user).permit(:timezone)
  end

  def set_redirect_url
    session[:from] = params[:from]
  end
end
