class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_oauth(oauth)

    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def oauth
    request.env['omniauth.auth']
  end
end