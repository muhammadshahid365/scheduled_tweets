class TwitterAccountsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @twitter_accounts = Current.user.twitter_accounts
  end

  def destroy
    Current.user.twitter_accounts.find(params[:id]).destroy

    redirect_to twitter_accounts_path, notice: 'Account disconnected'
  end
end
